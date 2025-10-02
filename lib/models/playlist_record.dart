import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/custom_text.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';

part 'generated/playlist_record.freezed.dart';

@freezed
sealed class PlaylistRecord extends Model with _$PlaylistRecord implements Record {
  const PlaylistRecord._();

  @Entity(realClass: PlaylistRecord)
  const factory PlaylistRecord({
    @Id(assignable: true) required int id,
    required int rank,
    required ToOne<BiblePassage> biblePassage,
    required ToOne<CustomText> customText,
    required ToOne<SongLyric> songLyric,
    required ToOne<Playlist> playlist,
  }) = _PlaylistRecord;
}
