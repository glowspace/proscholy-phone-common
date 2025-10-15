// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/author.dart';
import 'package:proscholy_common/models/external.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/playlist_record.dart';
import 'package:proscholy_common/models/settings.dart';
import 'package:proscholy_common/models/song.dart';
import 'package:proscholy_common/models/songbook_record.dart';
import 'package:proscholy_common/models/tag.dart';

part 'generated/song_lyric.freezed.dart';
part 'generated/song_lyric.g.dart';

enum SortType { random, alpha, numeric }

enum SongLyricType {
  original,
  translation,
  authorizedTranslation;

  factory SongLyricType.fromRawValue(int rawValue) => switch (rawValue) {
        0 => SongLyricType.original,
        1 => SongLyricType.authorizedTranslation,
        _ => SongLyricType.translation,
      };

  static int rawValueFromString(String? string) => switch (string) {
        "ORIGINAL" => 0,
        "AUTHORIZED_TRANSLATION" => 1,
        _ => 2,
      };
}

@freezed
sealed class SongLyric extends Model with _$SongLyric, ContentItem, RecentItem {
  const SongLyric._();

  @Entity(realClass: SongLyric)
  const factory SongLyric({
    @Id(assignable: true) @JsonKey(fromJson: int.parse) required int id,
    required String name,
    @JsonKey(name: 'secondary_name_1') @Default('') String secondaryName1,
    @JsonKey(name: 'secondary_name_2') @Default('') String secondaryName2,
    @Default('') String lyrics,
    @JsonKey(name: 'hymnology') @Default('') String hymnology,
    required String lang,
    @JsonKey(name: 'type_enum', fromJson: SongLyricType.rawValueFromString) required int dbType,
    required bool isArrangement,
    @JsonKey(fromJson: _songFromJson) required ToOne<Song> song,
    @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson) required ToMany<Author> authors,
    @JsonKey(fromJson: _externalsFromJson) required ToMany<External> externals,
    @Backlink() @JsonKey(fromJson: _songbookRecordsFromJson) required ToMany<SongbookRecord> songbookRecords,
    @JsonKey(fromJson: _tagsFromJson) required ToMany<Tag> tags,
    // these last two are not loaded from API, but are only local
    @JsonKey(fromJson: _settingsFromJson) required ToOne<SongLyricSettingsModel> settings,
    @Backlink() @JsonKey(fromJson: _playlistRecordsFromJson) required ToMany<PlaylistRecord> playlistRecords,
  }) = _SongLyric;

  factory SongLyric.fromJson(Map<String, dynamic> json) => _$SongLyricFromJson(json);

  SongLyricType get type => SongLyricType.fromRawValue(dbType);
}

ToOne<Song> _songFromJson(Map<String, dynamic>? json) => json == null ? ToOne() : ToOne(targetId: int.parse(json['id']));

ToMany<Author> _authorsFromJson(List<dynamic> jsonList) {
  final authors = [for (final json in jsonList) Author(id: int.parse(json['pivot']['author']['id']), name: '')];

  return ToMany(items: authors);
}

ToMany<External> _externalsFromJson(List<dynamic>? jsonList) => ToMany();

ToMany<SongbookRecord> _songbookRecordsFromJson(List<dynamic> jsonList) {
  final songbookRecords = [for (final json in jsonList) SongbookRecord.fromJson(json['pivot'])];

  return ToMany(items: songbookRecords);
}

ToMany<Tag> _tagsFromJson(List<dynamic> jsonList) {
  final tags = [for (final json in jsonList) Tag(id: int.parse(json['id']), name: '', dbType: 0, songLyricsCount: 0)];

  return ToMany(items: tags);
}

ToOne<SongLyricSettingsModel> _settingsFromJson(Map<String, dynamic>? json) => ToOne();

ToMany<PlaylistRecord> _playlistRecordsFromJson(List<dynamic>? jsonList) => ToMany();
