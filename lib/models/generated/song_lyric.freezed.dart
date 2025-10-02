// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../song_lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongLyric {
  @Id(assignable: true)
  @JsonKey(fromJson: int.parse)
  int get id;
  @JsonKey(readValue: _readDisplayId)
  String get displayId;
  @JsonKey(readValue: _readDisplayName)
  String get displayName;
  String get name;
  @JsonKey(name: 'secondary_name_1')
  String get secondaryName1;
  @JsonKey(name: 'secondary_name_2')
  String get secondaryName2;
  String get lyrics;
  @JsonKey(name: 'hymnology')
  String get hymnology;
  String get lang;
  @JsonKey(name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
  int get dbType;
  bool get isArrangement;
  @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
  ToMany<Author> get authors;
  @JsonKey(fromJson: _externalsFromJson)
  ToMany<External> get externals;
  @JsonKey(fromJson: _songFromJson)
  ToOne<Song> get song;
  @Backlink()
  @JsonKey(fromJson: _songbookRecordsFromJson)
  ToMany<SongbookRecord> get songbookRecords;
  @JsonKey(fromJson: _tagsFromJson)
  ToMany<Tag>
      get tags; // these last two are not loaded from API, but are only local
  @JsonKey(fromJson: _settingsFromJson)
  ToOne<SongLyricSettingsModel> get settings;
  @Backlink()
  @JsonKey(fromJson: _playlistRecordsFromJson)
  ToMany<PlaylistRecord> get playlistRecords;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongLyricCopyWith<SongLyric> get copyWith =>
      _$SongLyricCopyWithImpl<SongLyric>(this as SongLyric, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongLyric &&
            super == other &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayId, displayId) ||
                other.displayId == displayId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.secondaryName1, secondaryName1) ||
                other.secondaryName1 == secondaryName1) &&
            (identical(other.secondaryName2, secondaryName2) ||
                other.secondaryName2 == secondaryName2) &&
            (identical(other.lyrics, lyrics) || other.lyrics == lyrics) &&
            (identical(other.hymnology, hymnology) ||
                other.hymnology == hymnology) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.dbType, dbType) || other.dbType == dbType) &&
            (identical(other.isArrangement, isArrangement) ||
                other.isArrangement == isArrangement) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.externals, externals) &&
            (identical(other.song, song) || other.song == song) &&
            const DeepCollectionEquality()
                .equals(other.songbookRecords, songbookRecords) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality()
                .equals(other.playlistRecords, playlistRecords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        super.hashCode,
        id,
        displayId,
        displayName,
        name,
        secondaryName1,
        secondaryName2,
        lyrics,
        hymnology,
        lang,
        dbType,
        isArrangement,
        const DeepCollectionEquality().hash(authors),
        const DeepCollectionEquality().hash(externals),
        song,
        const DeepCollectionEquality().hash(songbookRecords),
        const DeepCollectionEquality().hash(tags),
        settings,
        const DeepCollectionEquality().hash(playlistRecords)
      ]);

  @override
  String toString() {
    return 'SongLyric(id: $id, displayId: $displayId, displayName: $displayName, name: $name, secondaryName1: $secondaryName1, secondaryName2: $secondaryName2, lyrics: $lyrics, hymnology: $hymnology, lang: $lang, dbType: $dbType, isArrangement: $isArrangement, authors: $authors, externals: $externals, song: $song, songbookRecords: $songbookRecords, tags: $tags, settings: $settings, playlistRecords: $playlistRecords)';
  }
}

/// @nodoc
abstract mixin class $SongLyricCopyWith<$Res> {
  factory $SongLyricCopyWith(SongLyric value, $Res Function(SongLyric) _then) =
      _$SongLyricCopyWithImpl;
  @useResult
  $Res call(
      {@Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
      @JsonKey(readValue: _readDisplayId) String displayId,
      @JsonKey(readValue: _readDisplayName) String displayName,
      String name,
      @JsonKey(name: 'secondary_name_1') String secondaryName1,
      @JsonKey(name: 'secondary_name_2') String secondaryName2,
      String lyrics,
      @JsonKey(name: 'hymnology') String hymnology,
      String lang,
      @JsonKey(name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
      int dbType,
      bool isArrangement,
      @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
      ToMany<Author> authors,
      @JsonKey(fromJson: _externalsFromJson) ToMany<External> externals,
      @JsonKey(fromJson: _songFromJson) ToOne<Song> song,
      @Backlink()
      @JsonKey(fromJson: _songbookRecordsFromJson)
      ToMany<SongbookRecord> songbookRecords,
      @JsonKey(fromJson: _tagsFromJson) ToMany<Tag> tags,
      @JsonKey(fromJson: _settingsFromJson)
      ToOne<SongLyricSettingsModel> settings,
      @Backlink()
      @JsonKey(fromJson: _playlistRecordsFromJson)
      ToMany<PlaylistRecord> playlistRecords});
}

/// @nodoc
class _$SongLyricCopyWithImpl<$Res> implements $SongLyricCopyWith<$Res> {
  _$SongLyricCopyWithImpl(this._self, this._then);

  final SongLyric _self;
  final $Res Function(SongLyric) _then;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayId = null,
    Object? displayName = null,
    Object? name = null,
    Object? secondaryName1 = null,
    Object? secondaryName2 = null,
    Object? lyrics = null,
    Object? hymnology = null,
    Object? lang = null,
    Object? dbType = null,
    Object? isArrangement = null,
    Object? authors = null,
    Object? externals = null,
    Object? song = null,
    Object? songbookRecords = null,
    Object? tags = null,
    Object? settings = null,
    Object? playlistRecords = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayId: null == displayId
          ? _self.displayId
          : displayId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryName1: null == secondaryName1
          ? _self.secondaryName1
          : secondaryName1 // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryName2: null == secondaryName2
          ? _self.secondaryName2
          : secondaryName2 // ignore: cast_nullable_to_non_nullable
              as String,
      lyrics: null == lyrics
          ? _self.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      hymnology: null == hymnology
          ? _self.hymnology
          : hymnology // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      dbType: null == dbType
          ? _self.dbType
          : dbType // ignore: cast_nullable_to_non_nullable
              as int,
      isArrangement: null == isArrangement
          ? _self.isArrangement
          : isArrangement // ignore: cast_nullable_to_non_nullable
              as bool,
      authors: null == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as ToMany<Author>,
      externals: null == externals
          ? _self.externals
          : externals // ignore: cast_nullable_to_non_nullable
              as ToMany<External>,
      song: null == song
          ? _self.song
          : song // ignore: cast_nullable_to_non_nullable
              as ToOne<Song>,
      songbookRecords: null == songbookRecords
          ? _self.songbookRecords
          : songbookRecords // ignore: cast_nullable_to_non_nullable
              as ToMany<SongbookRecord>,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ToMany<Tag>,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ToOne<SongLyricSettingsModel>,
      playlistRecords: null == playlistRecords
          ? _self.playlistRecords
          : playlistRecords // ignore: cast_nullable_to_non_nullable
              as ToMany<PlaylistRecord>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SongLyric].
extension SongLyricPatterns on SongLyric {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SongLyric value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SongLyric value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SongLyric value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
            @JsonKey(readValue: _readDisplayId) String displayId,
            @JsonKey(readValue: _readDisplayName) String displayName,
            String name,
            @JsonKey(name: 'secondary_name_1') String secondaryName1,
            @JsonKey(name: 'secondary_name_2') String secondaryName2,
            String lyrics,
            @JsonKey(name: 'hymnology') String hymnology,
            String lang,
            @JsonKey(
                name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
            int dbType,
            bool isArrangement,
            @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
            ToMany<Author> authors,
            @JsonKey(fromJson: _externalsFromJson) ToMany<External> externals,
            @JsonKey(fromJson: _songFromJson) ToOne<Song> song,
            @Backlink()
            @JsonKey(fromJson: _songbookRecordsFromJson)
            ToMany<SongbookRecord> songbookRecords,
            @JsonKey(fromJson: _tagsFromJson) ToMany<Tag> tags,
            @JsonKey(fromJson: _settingsFromJson)
            ToOne<SongLyricSettingsModel> settings,
            @Backlink()
            @JsonKey(fromJson: _playlistRecordsFromJson)
            ToMany<PlaylistRecord> playlistRecords)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
        return $default(
            _that.id,
            _that.displayId,
            _that.displayName,
            _that.name,
            _that.secondaryName1,
            _that.secondaryName2,
            _that.lyrics,
            _that.hymnology,
            _that.lang,
            _that.dbType,
            _that.isArrangement,
            _that.authors,
            _that.externals,
            _that.song,
            _that.songbookRecords,
            _that.tags,
            _that.settings,
            _that.playlistRecords);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
            @JsonKey(readValue: _readDisplayId) String displayId,
            @JsonKey(readValue: _readDisplayName) String displayName,
            String name,
            @JsonKey(name: 'secondary_name_1') String secondaryName1,
            @JsonKey(name: 'secondary_name_2') String secondaryName2,
            String lyrics,
            @JsonKey(name: 'hymnology') String hymnology,
            String lang,
            @JsonKey(
                name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
            int dbType,
            bool isArrangement,
            @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
            ToMany<Author> authors,
            @JsonKey(fromJson: _externalsFromJson) ToMany<External> externals,
            @JsonKey(fromJson: _songFromJson) ToOne<Song> song,
            @Backlink()
            @JsonKey(fromJson: _songbookRecordsFromJson)
            ToMany<SongbookRecord> songbookRecords,
            @JsonKey(fromJson: _tagsFromJson) ToMany<Tag> tags,
            @JsonKey(fromJson: _settingsFromJson)
            ToOne<SongLyricSettingsModel> settings,
            @Backlink()
            @JsonKey(fromJson: _playlistRecordsFromJson)
            ToMany<PlaylistRecord> playlistRecords)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric():
        return $default(
            _that.id,
            _that.displayId,
            _that.displayName,
            _that.name,
            _that.secondaryName1,
            _that.secondaryName2,
            _that.lyrics,
            _that.hymnology,
            _that.lang,
            _that.dbType,
            _that.isArrangement,
            _that.authors,
            _that.externals,
            _that.song,
            _that.songbookRecords,
            _that.tags,
            _that.settings,
            _that.playlistRecords);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
            @JsonKey(readValue: _readDisplayId) String displayId,
            @JsonKey(readValue: _readDisplayName) String displayName,
            String name,
            @JsonKey(name: 'secondary_name_1') String secondaryName1,
            @JsonKey(name: 'secondary_name_2') String secondaryName2,
            String lyrics,
            @JsonKey(name: 'hymnology') String hymnology,
            String lang,
            @JsonKey(
                name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
            int dbType,
            bool isArrangement,
            @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
            ToMany<Author> authors,
            @JsonKey(fromJson: _externalsFromJson) ToMany<External> externals,
            @JsonKey(fromJson: _songFromJson) ToOne<Song> song,
            @Backlink()
            @JsonKey(fromJson: _songbookRecordsFromJson)
            ToMany<SongbookRecord> songbookRecords,
            @JsonKey(fromJson: _tagsFromJson) ToMany<Tag> tags,
            @JsonKey(fromJson: _settingsFromJson)
            ToOne<SongLyricSettingsModel> settings,
            @Backlink()
            @JsonKey(fromJson: _playlistRecordsFromJson)
            ToMany<PlaylistRecord> playlistRecords)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyric() when $default != null:
        return $default(
            _that.id,
            _that.displayId,
            _that.displayName,
            _that.name,
            _that.secondaryName1,
            _that.secondaryName2,
            _that.lyrics,
            _that.hymnology,
            _that.lang,
            _that.dbType,
            _that.isArrangement,
            _that.authors,
            _that.externals,
            _that.song,
            _that.songbookRecords,
            _that.tags,
            _that.settings,
            _that.playlistRecords);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
@Entity(realClass: SongLyric)
class _SongLyric extends SongLyric {
  const _SongLyric(
      {@Id(assignable: true) @JsonKey(fromJson: int.parse) required this.id,
      @JsonKey(readValue: _readDisplayId) required this.displayId,
      @JsonKey(readValue: _readDisplayName) required this.displayName,
      required this.name,
      @JsonKey(name: 'secondary_name_1') this.secondaryName1 = '',
      @JsonKey(name: 'secondary_name_2') this.secondaryName2 = '',
      this.lyrics = '',
      @JsonKey(name: 'hymnology') this.hymnology = '',
      required this.lang,
      @JsonKey(name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
      required this.dbType,
      required this.isArrangement,
      @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
      required this.authors,
      @JsonKey(fromJson: _externalsFromJson) required this.externals,
      @JsonKey(fromJson: _songFromJson) required this.song,
      @Backlink()
      @JsonKey(fromJson: _songbookRecordsFromJson)
      required this.songbookRecords,
      @JsonKey(fromJson: _tagsFromJson) required this.tags,
      @JsonKey(fromJson: _settingsFromJson) required this.settings,
      @Backlink()
      @JsonKey(fromJson: _playlistRecordsFromJson)
      required this.playlistRecords})
      : super._();
  factory _SongLyric.fromJson(Map<String, dynamic> json) =>
      _$SongLyricFromJson(json);

  @override
  @Id(assignable: true)
  @JsonKey(fromJson: int.parse)
  final int id;
  @override
  @JsonKey(readValue: _readDisplayId)
  final String displayId;
  @override
  @JsonKey(readValue: _readDisplayName)
  final String displayName;
  @override
  final String name;
  @override
  @JsonKey(name: 'secondary_name_1')
  final String secondaryName1;
  @override
  @JsonKey(name: 'secondary_name_2')
  final String secondaryName2;
  @override
  @JsonKey()
  final String lyrics;
  @override
  @JsonKey(name: 'hymnology')
  final String hymnology;
  @override
  final String lang;
  @override
  @JsonKey(name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
  final int dbType;
  @override
  final bool isArrangement;
  @override
  @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
  final ToMany<Author> authors;
  @override
  @JsonKey(fromJson: _externalsFromJson)
  final ToMany<External> externals;
  @override
  @JsonKey(fromJson: _songFromJson)
  final ToOne<Song> song;
  @override
  @Backlink()
  @JsonKey(fromJson: _songbookRecordsFromJson)
  final ToMany<SongbookRecord> songbookRecords;
  @override
  @JsonKey(fromJson: _tagsFromJson)
  final ToMany<Tag> tags;
// these last two are not loaded from API, but are only local
  @override
  @JsonKey(fromJson: _settingsFromJson)
  final ToOne<SongLyricSettingsModel> settings;
  @override
  @Backlink()
  @JsonKey(fromJson: _playlistRecordsFromJson)
  final ToMany<PlaylistRecord> playlistRecords;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongLyricCopyWith<_SongLyric> get copyWith =>
      __$SongLyricCopyWithImpl<_SongLyric>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongLyric &&
            super == other &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayId, displayId) ||
                other.displayId == displayId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.secondaryName1, secondaryName1) ||
                other.secondaryName1 == secondaryName1) &&
            (identical(other.secondaryName2, secondaryName2) ||
                other.secondaryName2 == secondaryName2) &&
            (identical(other.lyrics, lyrics) || other.lyrics == lyrics) &&
            (identical(other.hymnology, hymnology) ||
                other.hymnology == hymnology) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.dbType, dbType) || other.dbType == dbType) &&
            (identical(other.isArrangement, isArrangement) ||
                other.isArrangement == isArrangement) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            const DeepCollectionEquality().equals(other.externals, externals) &&
            (identical(other.song, song) || other.song == song) &&
            const DeepCollectionEquality()
                .equals(other.songbookRecords, songbookRecords) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality()
                .equals(other.playlistRecords, playlistRecords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        super.hashCode,
        id,
        displayId,
        displayName,
        name,
        secondaryName1,
        secondaryName2,
        lyrics,
        hymnology,
        lang,
        dbType,
        isArrangement,
        const DeepCollectionEquality().hash(authors),
        const DeepCollectionEquality().hash(externals),
        song,
        const DeepCollectionEquality().hash(songbookRecords),
        const DeepCollectionEquality().hash(tags),
        settings,
        const DeepCollectionEquality().hash(playlistRecords)
      ]);

  @override
  String toString() {
    return 'SongLyric(id: $id, displayId: $displayId, displayName: $displayName, name: $name, secondaryName1: $secondaryName1, secondaryName2: $secondaryName2, lyrics: $lyrics, hymnology: $hymnology, lang: $lang, dbType: $dbType, isArrangement: $isArrangement, authors: $authors, externals: $externals, song: $song, songbookRecords: $songbookRecords, tags: $tags, settings: $settings, playlistRecords: $playlistRecords)';
  }
}

/// @nodoc
abstract mixin class _$SongLyricCopyWith<$Res>
    implements $SongLyricCopyWith<$Res> {
  factory _$SongLyricCopyWith(
          _SongLyric value, $Res Function(_SongLyric) _then) =
      __$SongLyricCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
      @JsonKey(readValue: _readDisplayId) String displayId,
      @JsonKey(readValue: _readDisplayName) String displayName,
      String name,
      @JsonKey(name: 'secondary_name_1') String secondaryName1,
      @JsonKey(name: 'secondary_name_2') String secondaryName2,
      String lyrics,
      @JsonKey(name: 'hymnology') String hymnology,
      String lang,
      @JsonKey(name: 'type_enum', fromJson: SongLyricType.rawValueFromString)
      int dbType,
      bool isArrangement,
      @JsonKey(name: 'authors_pivot', fromJson: _authorsFromJson)
      ToMany<Author> authors,
      @JsonKey(fromJson: _externalsFromJson) ToMany<External> externals,
      @JsonKey(fromJson: _songFromJson) ToOne<Song> song,
      @Backlink()
      @JsonKey(fromJson: _songbookRecordsFromJson)
      ToMany<SongbookRecord> songbookRecords,
      @JsonKey(fromJson: _tagsFromJson) ToMany<Tag> tags,
      @JsonKey(fromJson: _settingsFromJson)
      ToOne<SongLyricSettingsModel> settings,
      @Backlink()
      @JsonKey(fromJson: _playlistRecordsFromJson)
      ToMany<PlaylistRecord> playlistRecords});
}

/// @nodoc
class __$SongLyricCopyWithImpl<$Res> implements _$SongLyricCopyWith<$Res> {
  __$SongLyricCopyWithImpl(this._self, this._then);

  final _SongLyric _self;
  final $Res Function(_SongLyric) _then;

  /// Create a copy of SongLyric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? displayId = null,
    Object? displayName = null,
    Object? name = null,
    Object? secondaryName1 = null,
    Object? secondaryName2 = null,
    Object? lyrics = null,
    Object? hymnology = null,
    Object? lang = null,
    Object? dbType = null,
    Object? isArrangement = null,
    Object? authors = null,
    Object? externals = null,
    Object? song = null,
    Object? songbookRecords = null,
    Object? tags = null,
    Object? settings = null,
    Object? playlistRecords = null,
  }) {
    return _then(_SongLyric(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayId: null == displayId
          ? _self.displayId
          : displayId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryName1: null == secondaryName1
          ? _self.secondaryName1
          : secondaryName1 // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryName2: null == secondaryName2
          ? _self.secondaryName2
          : secondaryName2 // ignore: cast_nullable_to_non_nullable
              as String,
      lyrics: null == lyrics
          ? _self.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      hymnology: null == hymnology
          ? _self.hymnology
          : hymnology // ignore: cast_nullable_to_non_nullable
              as String,
      lang: null == lang
          ? _self.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      dbType: null == dbType
          ? _self.dbType
          : dbType // ignore: cast_nullable_to_non_nullable
              as int,
      isArrangement: null == isArrangement
          ? _self.isArrangement
          : isArrangement // ignore: cast_nullable_to_non_nullable
              as bool,
      authors: null == authors
          ? _self.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as ToMany<Author>,
      externals: null == externals
          ? _self.externals
          : externals // ignore: cast_nullable_to_non_nullable
              as ToMany<External>,
      song: null == song
          ? _self.song
          : song // ignore: cast_nullable_to_non_nullable
              as ToOne<Song>,
      songbookRecords: null == songbookRecords
          ? _self.songbookRecords
          : songbookRecords // ignore: cast_nullable_to_non_nullable
              as ToMany<SongbookRecord>,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as ToMany<Tag>,
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ToOne<SongLyricSettingsModel>,
      playlistRecords: null == playlistRecords
          ? _self.playlistRecords
          : playlistRecords // ignore: cast_nullable_to_non_nullable
              as ToMany<PlaylistRecord>,
    ));
  }
}

// dart format on
