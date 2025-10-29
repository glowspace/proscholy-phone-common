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
    required ToOne<SongLyric> songLyric,
    required ToOne<UserText> userText,
  }) = _PlaylistRecord;

  factory PlaylistRecord.biblePassage({
    required int id,
    required int rank,
    required Playlist playlist,
    required BiblePassage biblePassage,
  }) => PlaylistRecord(
    id: id,
    rank: rank,
    playlist: ToOne(target: playlist),
    biblePassage: ToOne(target: biblePassage),
    songLyric: ToOne(),
    userText: ToOne(),
  );

  factory PlaylistRecord.songLyric({
    required int id,
    required int rank,
    required Playlist playlist,
    required SongLyric songLyric,
  }) => PlaylistRecord(
    id: id,
    rank: rank,
    playlist: ToOne(target: playlist),
    biblePassage: ToOne(),
    songLyric: ToOne(target: songLyric),
    userText: ToOne(),
  );

  factory PlaylistRecord.userText({
    required int id,
    required int rank,
    required Playlist playlist,
    required UserText userText,
  }) => PlaylistRecord(
    id: id,
    rank: rank,
    playlist: ToOne(target: playlist),
    biblePassage: ToOne(),
    songLyric: ToOne(),
    userText: ToOne(target: userText),
  );
}
