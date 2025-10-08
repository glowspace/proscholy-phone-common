import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';

part 'generated/playlist_record.freezed.dart';

@freezed
sealed class PlaylistRecord extends Model with _$PlaylistRecord {
  const PlaylistRecord._();

  @Entity(realClass: PlaylistRecord)
  const factory PlaylistRecord({
    @Id(assignable: true) required int id,
    required int rank,
    required ToOne<Playlist> playlist,
    // only one relation will be valid at a time
    // would make more sense to have some kind of union, but does not make sense now trying to migrate all old data...
    required ToOne<BiblePassage> biblePassage,
    required ToOne<UserText> userText,
    required ToOne<SongLyric> songLyric,
  }) = _PlaylistRecord;
}
