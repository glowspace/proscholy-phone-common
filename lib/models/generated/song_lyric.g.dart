// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../song_lyric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongLyric _$SongLyricFromJson(Map<String, dynamic> json) => _SongLyric(
      id: int.parse(json['id'] as String),
      displayId: _readDisplayId(json, 'display_id') as String,
      displayName: _readDisplayName(json, 'display_name') as String,
      name: json['name'] as String,
      secondaryName1: json['secondary_name_1'] as String? ?? '',
      secondaryName2: json['secondary_name_2'] as String? ?? '',
      lyrics: json['lyrics'] as String? ?? '',
      hymnology: json['hymnology'] as String? ?? '',
      lang: json['lang'] as String,
      dbType: SongLyricType.rawValueFromString(json['type_enum'] as String?),
      isArrangement: json['is_arrangement'] as bool,
      authors: _authorsFromJson(json['authors_pivot'] as List),
      externals: _externalsFromJson(json['externals'] as List),
      song: _songFromJson(json['song'] as Map<String, dynamic>),
      songbookRecords:
          _songbookRecordsFromJson(json['songbook_records'] as List),
      tags: _tagsFromJson(json['tags'] as List),
      settings: _settingsFromJson(json['settings'] as Map<String, dynamic>?),
      playlistRecords:
          _playlistRecordsFromJson(json['playlist_records'] as List?),
    );
