import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proscholy_common/models/song_lyric.dart';

part 'generated/search_result.freezed.dart';

@freezed
sealed class SongLyricsSearchResult with _$SongLyricsSearchResult {
  const SongLyricsSearchResult._();

  const factory SongLyricsSearchResult({
    @Default('') String searchText,
    required List<SongLyric> songLyrics,
    SongLyric? matchedById,
    @Default([]) List<SongLyric> matchedBySongbookNumber,
  }) = _SongLyricsSearchResult;

  @override
  int get hashCode => Object.hash(runtimeType, searchText, songLyrics);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SongLyricsSearchResult &&
            runtimeType == other.runtimeType &&
            searchText == other.searchText &&
            songLyrics == other.songLyrics);
  }
}
