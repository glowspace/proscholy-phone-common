import 'package:collection/collection.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook.dart';

extension SongbookView on Songbook {
  List<SongLyric> get songLyrics {
    records.sort((a, b) => compareNatural(a.number, b.number));

    return records.map((record) => record.songLyric.target!).toList();
  }
}
