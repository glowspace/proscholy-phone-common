import 'package:collection/collection.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/playlist_record.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/utils/extensions/ref.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';

part 'generated/playlists.g.dart';

@Riverpod(keepAlive: true)
Playlist favoritePlaylist(Ref ref) {
  final box = ref.read(appDependenciesProvider).store.box<Playlist>();

  if (!box.contains(favoritesPlaylistId)) box.put(Playlist.favorites());

  return box.get(favoritesPlaylistId)!;
}

@riverpod
class PlaylistNotifier extends _$PlaylistNotifier {
  Store get _store => ref.read(appDependenciesProvider).store;

  @override
  Playlist build(Playlist playlist) {
    ref.watchEntity(
      Playlist_.id.equals(playlist.id),
      onChanged: (query) {
        if (query.findFirst() case final changedPlaylist?) state = changedPlaylist;
      },
    );

    return playlist;
  }

  Playlist duplicate(String name) {
    int nextRecordId = _store.box<PlaylistRecord>().nextId(PlaylistRecord_.id);

    final records = [
      for (final record in playlist.records)
        record.copyWith(
          id: nextRecordId++,
          biblePassage: record.biblePassage.targetId == 0
              ? ToOne()
              : ToOne(target: _storeBiblePassage(record.biblePassage.target!)),
          userText: record.userText.targetId == 0 ? ToOne() : ToOne(target: _storeUserText(record.userText.target!)),
        ),
    ];

    final duplicatedPlaylist = ref.read(playlistsProvider.notifier).addPlaylist(
      playlist.copyWith(
        name: name,
        rank: 0,
        records: ToMany(items: records),
      ),
    );

    return duplicatedPlaylist;
  }

  Playlist rename(String name) {
    final renamedPlaylist = state.copyWith(name: name);

    _store.box<Playlist>().put(renamedPlaylist);

    return renamedPlaylist;
  }

  // will add bible passage to records, when the bible passage is not yet stored in db (id == 0) it will also store it
  bool addBiblePassage(BiblePassage biblePassage, {int? atRank}) {
    return _store.runInTransaction(TxMode.write, () {
      if (biblePassage.id != 0 && state.records.any((record) => record.biblePassage.targetId == biblePassage.id)) {
        return false;
      }

      final record = PlaylistRecord.biblePassage(
        id: _store.box<PlaylistRecord>().nextId(PlaylistRecord_.id),
        rank: atRank ?? state.records.length,
        playlist: state,
        biblePassage: _storeBiblePassage(biblePassage),
      );

      _addRecord(record, atRank);

      return true;
    });
  }

  bool addSongLyric(SongLyric songLyric, {int? atRank}) {
    if (state.records.any((record) => record.songLyric.targetId == songLyric.id)) return false;

    final record = PlaylistRecord.songLyric(
      id: _store.box<PlaylistRecord>().nextId(PlaylistRecord_.id),
      rank: atRank ?? state.records.length,
      playlist: state,
      songLyric: songLyric,
    );

    _addRecord(record, atRank);

    // make sure the song lyric is updated without reloading it from DB
    songLyric.playlistRecords.add(record);

    return true;
  }

  // will add user text to records, when the user text is not yet stored in db (id == 0) it will also store it
  bool addUserText(UserText userText, {int? atRank}) {
    return _store.runInTransaction(TxMode.write, () {
      if (userText.id != 0 && state.records.any((record) => record.userText.targetId == userText.id)) {
        return false;
      }

      final record = PlaylistRecord.userText(
        id: _store.box<PlaylistRecord>().nextId(PlaylistRecord_.id),
        rank: atRank ?? state.records.length,
        playlist: state,
        userText: _storeUserText(userText),
      );

      _addRecord(record, atRank);

      return true;
    });
  }

  bool removeRecord(PlaylistRecord recordToRemove) {
    state.records.removeWhere((record) => record == recordToRemove);

    return _store.runInTransaction(TxMode.write, () {
      // remove linked bible passage or user text
      if (recordToRemove.biblePassage.target case final biblePassage?) {
        _store.box<BiblePassage>().remove(biblePassage.id);
      } else if (recordToRemove.userText.target case final userText?) {
        _store.box<UserText>().remove(userText.id);
      }

      return _store.box<PlaylistRecord>().remove(recordToRemove.id);
    });
  }

  bool remove() {
    return _store.runInTransaction(TxMode.write, () {
      _store.box<PlaylistRecord>().removeMany(state.records.map((record) => record.id).toList());

      // remove linked bible passages and user texts
      _store.box<BiblePassage>().removeMany(
        state.records
            .where((record) => record.biblePassage.targetId != 0)
            .map((record) => record.biblePassage.targetId)
            .toList(),
      );
      _store.box<UserText>().removeMany(
        state.records
            .where((record) => record.userText.targetId != 0)
            .map((record) => record.userText.targetId)
            .toList(),
      );

      return _store.box<Playlist>().remove(state.id);
    });
  }

  void _addRecord(PlaylistRecord record, int? atRank) {
    final box = _store.box<PlaylistRecord>();

    box.put(record);

    // update records rank, if inserted somewhere in the middle
    if (atRank != null) {
      final recordsAfter = state.records
          .sublist(atRank)
          .map((record) => record.copyWith(rank: record.rank + 1))
          .toList();

      box.putMany(recordsAfter);

      state.records.replaceRange(atRank, state.records.length, [record, ...recordsAfter]);
    } else {
      state.records.add(record);
    }
  }

  BiblePassage _storeBiblePassage(BiblePassage biblePassage) {
    final biblePassageBox = _store.box<BiblePassage>();

    final storedBiblePassage = biblePassage.copyWith(id: biblePassageBox.nextId(BiblePassage_.id));
    biblePassageBox.put(storedBiblePassage);

    return storedBiblePassage;
  }

  UserText _storeUserText(UserText userText) {
    final userTextBox = _store.box<UserText>();

    final storedUserText = userText.copyWith(id: userTextBox.nextId(UserText_.id));
    userTextBox.put(storedUserText);

    return storedUserText;
  }
}

@riverpod
class PlaylistsNotifier extends _$PlaylistsNotifier {
  Store get _store => ref.read(appDependenciesProvider).store;

  @override
  List<Playlist> build() {
    final stream = _store.watchQuery(condition: Playlist_.id.notEquals(favoritesPlaylistId), orderBy: Playlist_.rank);
    final subscription = stream.listen((playlists) => state = playlists);

    ref.onDispose(subscription.cancel);

    return _store.query(condition: Playlist_.id.notEquals(favoritesPlaylistId), orderBy: Playlist_.rank);
  }

  Playlist addPlaylist(Playlist playlist) {
    final addedPlaylist = playlist.copyWith(id: _store.box<Playlist>().nextId(Playlist_.id));

    // increase rank of playlists after added
    final playlists = state;

    playlists.insert(playlist.rank, addedPlaylist);

    _store.box<Playlist>().putMany(playlists.mapIndexed((index, playlist) => playlist.copyWith(rank: index)).toList());

    return addedPlaylist;
  }

  void reorderPlaylists(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;

    final playlists = state;

    playlists.insert(newIndex, playlists.removeAt(oldIndex));

    _store.box<Playlist>().putMany(playlists.mapIndexed((index, playlist) => playlist.copyWith(rank: index)).toList());
  }
}
