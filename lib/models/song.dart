// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/song_lyric.dart';

part 'generated/song.freezed.dart';
part 'generated/song.g.dart';

@freezed
sealed class Song extends Model with _$Song {
  const Song._();

  @Entity(realClass: Song)
  const factory Song({
    @Id(assignable: true) @JsonKey(fromJson: int.parse) required int id,
    required String name,
    @Backlink() @JsonKey(fromJson: _songLyricsFromJson) required ToMany<SongLyric> songLyrics,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

ToMany<SongLyric> _songLyricsFromJson(List<dynamic> jsonList) => ToMany();
