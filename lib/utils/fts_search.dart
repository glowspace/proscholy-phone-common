import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/song_lyrics_search_result.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_bm25/sqlite_bm25.dart';

// [name, secondary_name_1, secondary_name_2, lyrics, authors, hymnology]
const List<double> _searchResultsWeights = [40.0, 35.0, 30.0, 1.0, 2.0, 5.0];

const String _dropSongLyricsSearchQuery = 'DROP TABLE song_lyrics_search';

const String _createTableQuery =
    'CREATE VIRTUAL TABLE IF NOT EXISTS song_lyrics_search USING FTS4(name, secondary_name_1, secondary_name_2, lyrics, authors, hymnology, tokenize=unicode61);';

const String _upsertQuery =
    'INSERT OR REPLACE INTO song_lyrics_search(rowid, name, secondary_name_1, secondary_name_2, lyrics, authors, hymnology) VALUES(?, ?, ?, ?, ?, ?, ?);';

const String _selectQuery =
    'SELECT rowid, matchinfo(song_lyrics_search, "pcnalx") as info FROM song_lyrics_search WHERE song_lyrics_search MATCH ?;';

class FTSSearch {
  final Database database;
  final Box<SongLyric> songLyricsBox;

  FTSSearch({required this.database, required this.songLyricsBox});

  Future<void> insertInitial(List<SongLyric> songLyrics) async {
    // drop the table as there might be change in structure from last version
    try {
      await database.execute(_dropSongLyricsSearchQuery);
      // ignore: empty_catches
    } on DatabaseException {} // ignore exceptions if database does not exist

    await database.execute(_createTableQuery);

    await update(songLyrics);
  }

  Future<void> update(List<SongLyric> songLyrics) async {
    final batch = database.batch();

    for (final songLyric in songLyrics) {
      batch.execute(_upsertQuery, [
        songLyric.id,
        songLyric.name,
        songLyric.secondaryName1,
        songLyric.secondaryName2,
        songLyric.lyrics,
        songLyric.authors.map((author) => author.name).join(','),
        songLyric.hymnology,
      ]);
    }

    await batch.commit();
  }

  Future<SongLyricsSearchResult> search(String searchText) async {
    searchText = searchText.trim();

    if (searchText.isEmpty) return const SongLyricsSearchResult();

    final ranks = <int, double>{};
    final searchResults = <int>[];

    for (final value in await database.rawQuery(_selectQuery, [searchText])) {
      final songLyricId = value['rowid'] as int;

      searchResults.add(songLyricId);
      ranks[songLyricId] = bm25(value['info'] as Uint8List, weights: _searchResultsWeights);
    }

    searchResults.sort((a, b) => ranks[a]!.compareTo(ranks[b]!));

    final songLyrics = await songLyricsBox.getManyAsync(searchResults);

    return SongLyricsSearchResult(
      songLyrics: songLyrics.cast(),
    );
  }
}
