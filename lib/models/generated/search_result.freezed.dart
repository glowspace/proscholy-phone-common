// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SongLyricsSearchResult {
  String get searchText;
  List<SongLyric> get songLyrics;
  SongLyric? get matchedById;
  List<SongLyric> get matchedBySongbookNumber;

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
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality()
                .equals(other.songLyrics, songLyrics) &&
            (identical(other.matchedById, matchedById) ||
                other.matchedById == matchedById) &&
            const DeepCollectionEquality().equals(
                other.matchedBySongbookNumber, matchedBySongbookNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchText,
      const DeepCollectionEquality().hash(songLyrics),
      matchedById,
      const DeepCollectionEquality().hash(matchedBySongbookNumber));

  @override
  String toString() {
    return 'SongLyricsSearchResult(searchText: $searchText, songLyrics: $songLyrics, matchedById: $matchedById, matchedBySongbookNumber: $matchedBySongbookNumber)';
  }
}

/// @nodoc
abstract mixin class $SongLyricsSearchResultCopyWith<$Res> {
  factory $SongLyricsSearchResultCopyWith(SongLyricsSearchResult value,
          $Res Function(SongLyricsSearchResult) _then) =
      _$SongLyricsSearchResultCopyWithImpl;
  @useResult
  $Res call(
      {String searchText,
      List<SongLyric> songLyrics,
      SongLyric? matchedById,
      List<SongLyric> matchedBySongbookNumber});

  $SongLyricCopyWith<$Res>? get matchedById;
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
    Object? searchText = null,
    Object? songLyrics = null,
    Object? matchedById = freezed,
    Object? matchedBySongbookNumber = null,
  }) {
    return _then(_self.copyWith(
      searchText: null == searchText
          ? _self.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      songLyrics: null == songLyrics
          ? _self.songLyrics
          : songLyrics // ignore: cast_nullable_to_non_nullable
              as List<SongLyric>,
      matchedById: freezed == matchedById
          ? _self.matchedById
          : matchedById // ignore: cast_nullable_to_non_nullable
              as SongLyric?,
      matchedBySongbookNumber: null == matchedBySongbookNumber
          ? _self.matchedBySongbookNumber
          : matchedBySongbookNumber // ignore: cast_nullable_to_non_nullable
              as List<SongLyric>,
    ));
  }

  /// Create a copy of SongLyricsSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SongLyricCopyWith<$Res>? get matchedById {
    if (_self.matchedById == null) {
      return null;
    }

    return $SongLyricCopyWith<$Res>(_self.matchedById!, (value) {
      return _then(_self.copyWith(matchedById: value));
    });
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
    TResult Function(String searchText, List<SongLyric> songLyrics,
            SongLyric? matchedById, List<SongLyric> matchedBySongbookNumber)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult() when $default != null:
        return $default(_that.searchText, _that.songLyrics, _that.matchedById,
            _that.matchedBySongbookNumber);
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
    TResult Function(String searchText, List<SongLyric> songLyrics,
            SongLyric? matchedById, List<SongLyric> matchedBySongbookNumber)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult():
        return $default(_that.searchText, _that.songLyrics, _that.matchedById,
            _that.matchedBySongbookNumber);
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
    TResult? Function(String searchText, List<SongLyric> songLyrics,
            SongLyric? matchedById, List<SongLyric> matchedBySongbookNumber)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SongLyricsSearchResult() when $default != null:
        return $default(_that.searchText, _that.songLyrics, _that.matchedById,
            _that.matchedBySongbookNumber);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SongLyricsSearchResult extends SongLyricsSearchResult {
  const _SongLyricsSearchResult(
      {this.searchText = '',
      required final List<SongLyric> songLyrics,
      this.matchedById,
      final List<SongLyric> matchedBySongbookNumber = const []})
      : _songLyrics = songLyrics,
        _matchedBySongbookNumber = matchedBySongbookNumber,
        super._();

  @override
  @JsonKey()
  final String searchText;
  final List<SongLyric> _songLyrics;
  @override
  List<SongLyric> get songLyrics {
    if (_songLyrics is EqualUnmodifiableListView) return _songLyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songLyrics);
  }

  @override
  final SongLyric? matchedById;
  final List<SongLyric> _matchedBySongbookNumber;
  @override
  @JsonKey()
  List<SongLyric> get matchedBySongbookNumber {
    if (_matchedBySongbookNumber is EqualUnmodifiableListView)
      return _matchedBySongbookNumber;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedBySongbookNumber);
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
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality()
                .equals(other._songLyrics, _songLyrics) &&
            (identical(other.matchedById, matchedById) ||
                other.matchedById == matchedById) &&
            const DeepCollectionEquality().equals(
                other._matchedBySongbookNumber, _matchedBySongbookNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchText,
      const DeepCollectionEquality().hash(_songLyrics),
      matchedById,
      const DeepCollectionEquality().hash(_matchedBySongbookNumber));

  @override
  String toString() {
    return 'SongLyricsSearchResult(searchText: $searchText, songLyrics: $songLyrics, matchedById: $matchedById, matchedBySongbookNumber: $matchedBySongbookNumber)';
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
  $Res call(
      {String searchText,
      List<SongLyric> songLyrics,
      SongLyric? matchedById,
      List<SongLyric> matchedBySongbookNumber});

  @override
  $SongLyricCopyWith<$Res>? get matchedById;
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
    Object? searchText = null,
    Object? songLyrics = null,
    Object? matchedById = freezed,
    Object? matchedBySongbookNumber = null,
  }) {
    return _then(_SongLyricsSearchResult(
      searchText: null == searchText
          ? _self.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      songLyrics: null == songLyrics
          ? _self._songLyrics
          : songLyrics // ignore: cast_nullable_to_non_nullable
              as List<SongLyric>,
      matchedById: freezed == matchedById
          ? _self.matchedById
          : matchedById // ignore: cast_nullable_to_non_nullable
              as SongLyric?,
      matchedBySongbookNumber: null == matchedBySongbookNumber
          ? _self._matchedBySongbookNumber
          : matchedBySongbookNumber // ignore: cast_nullable_to_non_nullable
              as List<SongLyric>,
    ));
  }

  /// Create a copy of SongLyricsSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SongLyricCopyWith<$Res>? get matchedById {
    if (_self.matchedById == null) {
      return null;
    }

    return $SongLyricCopyWith<$Res>(_self.matchedById!, (value) {
      return _then(_self.copyWith(matchedById: value));
    });
  }
}

// dart format on
