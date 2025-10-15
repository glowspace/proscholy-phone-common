import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proscholy_common/models/song_lyric.dart';

part 'generated/song_lyrics_search_result.freezed.dart';

@freezed
sealed class SongLyricsSearchResult with _$SongLyricsSearchResult {
  const factory SongLyricsSearchResult({List<SongLyric>? songLyrics}) = _SongLyricsSearchResult;
}
