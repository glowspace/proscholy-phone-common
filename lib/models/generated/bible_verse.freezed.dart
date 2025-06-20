// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../bible_verse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BibleVerse {
  @Id(assignable: true)
  int get id;
  int get book;
  int get chapter;
  int get startVerse;
  int? get endVerse;
  String get text;

  /// Create a copy of BibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BibleVerseCopyWith<BibleVerse> get copyWith =>
      _$BibleVerseCopyWithImpl<BibleVerse>(this as BibleVerse, _$identity);

  @override
  String toString() {
    return 'BibleVerse(id: $id, book: $book, chapter: $chapter, startVerse: $startVerse, endVerse: $endVerse, text: $text)';
  }
}

/// @nodoc
abstract mixin class $BibleVerseCopyWith<$Res> {
  factory $BibleVerseCopyWith(
          BibleVerse value, $Res Function(BibleVerse) _then) =
      _$BibleVerseCopyWithImpl;
  @useResult
  $Res call(
      {@Id(assignable: true) int id,
      int book,
      int chapter,
      int startVerse,
      int? endVerse,
      String text});
}

/// @nodoc
class _$BibleVerseCopyWithImpl<$Res> implements $BibleVerseCopyWith<$Res> {
  _$BibleVerseCopyWithImpl(this._self, this._then);

  final BibleVerse _self;
  final $Res Function(BibleVerse) _then;

  /// Create a copy of BibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? book = null,
    Object? chapter = null,
    Object? startVerse = null,
    Object? endVerse = freezed,
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      book: null == book
          ? _self.book
          : book // ignore: cast_nullable_to_non_nullable
              as int,
      chapter: null == chapter
          ? _self.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      startVerse: null == startVerse
          ? _self.startVerse
          : startVerse // ignore: cast_nullable_to_non_nullable
              as int,
      endVerse: freezed == endVerse
          ? _self.endVerse
          : endVerse // ignore: cast_nullable_to_non_nullable
              as int?,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Entity(realClass: BibleVerse)
class _BibleVerse extends BibleVerse {
  const _BibleVerse(
      {@Id(assignable: true) required this.id,
      required this.book,
      required this.chapter,
      required this.startVerse,
      this.endVerse,
      required this.text})
      : super._();

  @override
  @Id(assignable: true)
  final int id;
  @override
  final int book;
  @override
  final int chapter;
  @override
  final int startVerse;
  @override
  final int? endVerse;
  @override
  final String text;

  /// Create a copy of BibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BibleVerseCopyWith<_BibleVerse> get copyWith =>
      __$BibleVerseCopyWithImpl<_BibleVerse>(this, _$identity);

  @override
  String toString() {
    return 'BibleVerse(id: $id, book: $book, chapter: $chapter, startVerse: $startVerse, endVerse: $endVerse, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$BibleVerseCopyWith<$Res>
    implements $BibleVerseCopyWith<$Res> {
  factory _$BibleVerseCopyWith(
          _BibleVerse value, $Res Function(_BibleVerse) _then) =
      __$BibleVerseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int id,
      int book,
      int chapter,
      int startVerse,
      int? endVerse,
      String text});
}

/// @nodoc
class __$BibleVerseCopyWithImpl<$Res> implements _$BibleVerseCopyWith<$Res> {
  __$BibleVerseCopyWithImpl(this._self, this._then);

  final _BibleVerse _self;
  final $Res Function(_BibleVerse) _then;

  /// Create a copy of BibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? book = null,
    Object? chapter = null,
    Object? startVerse = null,
    Object? endVerse = freezed,
    Object? text = null,
  }) {
    return _then(_BibleVerse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      book: null == book
          ? _self.book
          : book // ignore: cast_nullable_to_non_nullable
              as int,
      chapter: null == chapter
          ? _self.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      startVerse: null == startVerse
          ? _self.startVerse
          : startVerse // ignore: cast_nullable_to_non_nullable
              as int,
      endVerse: freezed == endVerse
          ? _self.endVerse
          : endVerse // ignore: cast_nullable_to_non_nullable
              as int?,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
