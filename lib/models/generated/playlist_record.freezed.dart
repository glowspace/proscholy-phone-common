// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../playlist_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistRecord {
  @Id(assignable: true)
  int get id;
  int get rank;
  ToOne<Playlist> get playlist; // only one relation will be valid at a time
// would make more sense to have some kind of union, but does not make sense now trying to migrate all old data...
  ToOne<BiblePassage> get biblePassage;
  ToOne<UserText> get userText;
  ToOne<SongLyric> get songLyric;

  /// Create a copy of PlaylistRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistRecordCopyWith<PlaylistRecord> get copyWith =>
      _$PlaylistRecordCopyWithImpl<PlaylistRecord>(
          this as PlaylistRecord, _$identity);

  @override
  String toString() {
    return 'PlaylistRecord(id: $id, rank: $rank, playlist: $playlist, biblePassage: $biblePassage, userText: $userText, songLyric: $songLyric)';
  }
}

/// @nodoc
abstract mixin class $PlaylistRecordCopyWith<$Res> {
  factory $PlaylistRecordCopyWith(
          PlaylistRecord value, $Res Function(PlaylistRecord) _then) =
      _$PlaylistRecordCopyWithImpl;
  @useResult
  $Res call(
      {@Id(assignable: true) int id,
      int rank,
      ToOne<Playlist> playlist,
      ToOne<BiblePassage> biblePassage,
      ToOne<UserText> userText,
      ToOne<SongLyric> songLyric});
}

/// @nodoc
class _$PlaylistRecordCopyWithImpl<$Res>
    implements $PlaylistRecordCopyWith<$Res> {
  _$PlaylistRecordCopyWithImpl(this._self, this._then);

  final PlaylistRecord _self;
  final $Res Function(PlaylistRecord) _then;

  /// Create a copy of PlaylistRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rank = null,
    Object? playlist = null,
    Object? biblePassage = null,
    Object? userText = null,
    Object? songLyric = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: null == playlist
          ? _self.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as ToOne<Playlist>,
      biblePassage: null == biblePassage
          ? _self.biblePassage
          : biblePassage // ignore: cast_nullable_to_non_nullable
              as ToOne<BiblePassage>,
      userText: null == userText
          ? _self.userText
          : userText // ignore: cast_nullable_to_non_nullable
              as ToOne<UserText>,
      songLyric: null == songLyric
          ? _self.songLyric
          : songLyric // ignore: cast_nullable_to_non_nullable
              as ToOne<SongLyric>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaylistRecord].
extension PlaylistRecordPatterns on PlaylistRecord {
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
    TResult Function(_PlaylistRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistRecord() when $default != null:
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
    TResult Function(_PlaylistRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistRecord():
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
    TResult? Function(_PlaylistRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistRecord() when $default != null:
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
            @Id(assignable: true) int id,
            int rank,
            ToOne<Playlist> playlist,
            ToOne<BiblePassage> biblePassage,
            ToOne<UserText> userText,
            ToOne<SongLyric> songLyric)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistRecord() when $default != null:
        return $default(_that.id, _that.rank, _that.playlist,
            _that.biblePassage, _that.userText, _that.songLyric);
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
            @Id(assignable: true) int id,
            int rank,
            ToOne<Playlist> playlist,
            ToOne<BiblePassage> biblePassage,
            ToOne<UserText> userText,
            ToOne<SongLyric> songLyric)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistRecord():
        return $default(_that.id, _that.rank, _that.playlist,
            _that.biblePassage, _that.userText, _that.songLyric);
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
            @Id(assignable: true) int id,
            int rank,
            ToOne<Playlist> playlist,
            ToOne<BiblePassage> biblePassage,
            ToOne<UserText> userText,
            ToOne<SongLyric> songLyric)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistRecord() when $default != null:
        return $default(_that.id, _that.rank, _that.playlist,
            _that.biblePassage, _that.userText, _that.songLyric);
      case _:
        return null;
    }
  }
}

/// @nodoc

@Entity(realClass: PlaylistRecord)
class _PlaylistRecord extends PlaylistRecord {
  const _PlaylistRecord(
      {@Id(assignable: true) required this.id,
      required this.rank,
      required this.playlist,
      required this.biblePassage,
      required this.userText,
      required this.songLyric})
      : super._();

  @override
  @Id(assignable: true)
  final int id;
  @override
  final int rank;
  @override
  final ToOne<Playlist> playlist;
// only one relation will be valid at a time
// would make more sense to have some kind of union, but does not make sense now trying to migrate all old data...
  @override
  final ToOne<BiblePassage> biblePassage;
  @override
  final ToOne<UserText> userText;
  @override
  final ToOne<SongLyric> songLyric;

  /// Create a copy of PlaylistRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistRecordCopyWith<_PlaylistRecord> get copyWith =>
      __$PlaylistRecordCopyWithImpl<_PlaylistRecord>(this, _$identity);

  @override
  String toString() {
    return 'PlaylistRecord(id: $id, rank: $rank, playlist: $playlist, biblePassage: $biblePassage, userText: $userText, songLyric: $songLyric)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistRecordCopyWith<$Res>
    implements $PlaylistRecordCopyWith<$Res> {
  factory _$PlaylistRecordCopyWith(
          _PlaylistRecord value, $Res Function(_PlaylistRecord) _then) =
      __$PlaylistRecordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int id,
      int rank,
      ToOne<Playlist> playlist,
      ToOne<BiblePassage> biblePassage,
      ToOne<UserText> userText,
      ToOne<SongLyric> songLyric});
}

/// @nodoc
class __$PlaylistRecordCopyWithImpl<$Res>
    implements _$PlaylistRecordCopyWith<$Res> {
  __$PlaylistRecordCopyWithImpl(this._self, this._then);

  final _PlaylistRecord _self;
  final $Res Function(_PlaylistRecord) _then;

  /// Create a copy of PlaylistRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? rank = null,
    Object? playlist = null,
    Object? biblePassage = null,
    Object? userText = null,
    Object? songLyric = null,
  }) {
    return _then(_PlaylistRecord(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: null == playlist
          ? _self.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as ToOne<Playlist>,
      biblePassage: null == biblePassage
          ? _self.biblePassage
          : biblePassage // ignore: cast_nullable_to_non_nullable
              as ToOne<BiblePassage>,
      userText: null == userText
          ? _self.userText
          : userText // ignore: cast_nullable_to_non_nullable
              as ToOne<UserText>,
      songLyric: null == songLyric
          ? _self.songLyric
          : songLyric // ignore: cast_nullable_to_non_nullable
              as ToOne<SongLyric>,
    ));
  }
}

// dart format on
