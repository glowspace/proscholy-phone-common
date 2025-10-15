// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../song_lyrics_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongLyricsSearchResult {
  List<SongLyric>? get songLyrics;

  /// Create a copy of SongLyricsSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SongLyricsSearchResultCopyWith<SongLyricsSearchResult> get copyWith =>
      _$SongLyricsSearchResultCopyWithImpl<SongLyricsSearchResult>(
          this as SongLyricsSearchResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SongLyricsSearchResult &&
            const DeepCollectionEquality()
                .equals(other.songLyrics, songLyrics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(songLyrics));

  @override
  String toString() {
    return 'SongLyricsSearchResult(songLyrics: $songLyrics)';
  }
}

/// @nodoc
abstract mixin class $SongLyricsSearchResultCopyWith<$Res> {
  factory $SongLyricsSearchResultCopyWith(SongLyricsSearchResult value,
          $Res Function(SongLyricsSearchResult) _then) =
      _$SongLyricsSearchResultCopyWithImpl;
  @useResult
  $Res call({List<SongLyric>? songLyrics});
}

/// @nodoc
class _$SongLyricsSearchResultCopyWithImpl<$Res>
    implements $SongLyricsSearchResultCopyWith<$Res> {
  _$SongLyricsSearchResultCopyWithImpl(this._self, this._then);

  final SongLyricsSearchResult _self;
  final $Res Function(SongLyricsSearchResult) _then;

  /// Create a copy of SongLyricsSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songLyrics = freezed,
  }) {
    return _then(_self.copyWith(
      songLyrics: freezed == songLyrics
          ? _self.songLyrics
          : songLyrics // ignore: cast_nullable_to_non_nullable
              as List<SongLyric>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SongLyricsSearchResult].
extension SongLyricsSearchResultPatterns on SongLyricsSearchResult {
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
    TResult Function(_SongLyricsSearchResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult() when $default != null:
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
    TResult Function(_SongLyricsSearchResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult():
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
    TResult? Function(_SongLyricsSearchResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult() when $default != null:
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
    TResult Function(List<SongLyric>? songLyrics)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult() when $default != null:
        return $default(_that.songLyrics);
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
    TResult Function(List<SongLyric>? songLyrics) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult():
        return $default(_that.songLyrics);
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
    TResult? Function(List<SongLyric>? songLyrics)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult() when $default != null:
        return $default(_that.songLyrics);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SongLyricsSearchResult implements SongLyricsSearchResult {
  const _SongLyricsSearchResult({final List<SongLyric>? songLyrics})
      : _songLyrics = songLyrics;

  final List<SongLyric>? _songLyrics;
  @override
  List<SongLyric>? get songLyrics {
    final value = _songLyrics;
    if (value == null) return null;
    if (_songLyrics is EqualUnmodifiableListView) return _songLyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of SongLyricsSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SongLyricsSearchResultCopyWith<_SongLyricsSearchResult> get copyWith =>
      __$SongLyricsSearchResultCopyWithImpl<_SongLyricsSearchResult>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SongLyricsSearchResult &&
            const DeepCollectionEquality()
                .equals(other._songLyrics, _songLyrics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songLyrics));

  @override
  String toString() {
    return 'SongLyricsSearchResult(songLyrics: $songLyrics)';
  }
}

/// @nodoc
abstract mixin class _$SongLyricsSearchResultCopyWith<$Res>
    implements $SongLyricsSearchResultCopyWith<$Res> {
  factory _$SongLyricsSearchResultCopyWith(_SongLyricsSearchResult value,
          $Res Function(_SongLyricsSearchResult) _then) =
      __$SongLyricsSearchResultCopyWithImpl;
  @override
  @useResult
  $Res call({List<SongLyric>? songLyrics});
}

/// @nodoc
class __$SongLyricsSearchResultCopyWithImpl<$Res>
    implements _$SongLyricsSearchResultCopyWith<$Res> {
  __$SongLyricsSearchResultCopyWithImpl(this._self, this._then);

  final _SongLyricsSearchResult _self;
  final $Res Function(_SongLyricsSearchResult) _then;

  /// Create a copy of SongLyricsSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? songLyrics = freezed,
  }) {
    return _then(_SongLyricsSearchResult(
      songLyrics: freezed == songLyrics
          ? _self._songLyrics
          : songLyrics // ignore: cast_nullable_to_non_nullable
              as List<SongLyric>?,
    ));
  }
}

// dart format on
