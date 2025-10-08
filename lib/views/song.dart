import 'package:collection/collection.dart';
import 'package:proscholy_common/models/song.dart';
import 'package:proscholy_common/models/song_lyric.dart';

extension SongView on Song {
  bool get hasTranslations => songLyrics.length > 1;

  SongLyric? get original => songLyrics.firstWhereOrNull((songLyric) => songLyric.type == SongLyricType.original);
}
