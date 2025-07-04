// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../news_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsItem {
  @Id(assignable: true)
  @JsonKey(fromJson: int.parse)
  int get id;
  String get text;
  String get link;
  @Property(type: PropertyType.date)
  DateTime? get expiresAt;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsItemCopyWith<NewsItem> get copyWith =>
      _$NewsItemCopyWithImpl<NewsItem>(this as NewsItem, _$identity);

  @override
  String toString() {
    return 'NewsItem(id: $id, text: $text, link: $link, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class $NewsItemCopyWith<$Res> {
  factory $NewsItemCopyWith(NewsItem value, $Res Function(NewsItem) _then) =
      _$NewsItemCopyWithImpl;
  @useResult
  $Res call(
      {@Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
      String text,
      String link,
      @Property(type: PropertyType.date) DateTime? expiresAt});
}

/// @nodoc
class _$NewsItemCopyWithImpl<$Res> implements $NewsItemCopyWith<$Res> {
  _$NewsItemCopyWithImpl(this._self, this._then);

  final NewsItem _self;
  final $Res Function(NewsItem) _then;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? link = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@Entity(realClass: NewsItem)
@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class _NewsItem extends NewsItem {
  const _NewsItem(
      {@Id(assignable: true) @JsonKey(fromJson: int.parse) required this.id,
      required this.text,
      required this.link,
      @Property(type: PropertyType.date) this.expiresAt})
      : super._();
  factory _NewsItem.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);

  @override
  @Id(assignable: true)
  @JsonKey(fromJson: int.parse)
  final int id;
  @override
  final String text;
  @override
  final String link;
  @override
  @Property(type: PropertyType.date)
  final DateTime? expiresAt;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsItemCopyWith<_NewsItem> get copyWith =>
      __$NewsItemCopyWithImpl<_NewsItem>(this, _$identity);

  @override
  String toString() {
    return 'NewsItem(id: $id, text: $text, link: $link, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class _$NewsItemCopyWith<$Res>
    implements $NewsItemCopyWith<$Res> {
  factory _$NewsItemCopyWith(_NewsItem value, $Res Function(_NewsItem) _then) =
      __$NewsItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) @JsonKey(fromJson: int.parse) int id,
      String text,
      String link,
      @Property(type: PropertyType.date) DateTime? expiresAt});
}

/// @nodoc
class __$NewsItemCopyWithImpl<$Res> implements _$NewsItemCopyWith<$Res> {
  __$NewsItemCopyWithImpl(this._self, this._then);

  final _NewsItem _self;
  final $Res Function(_NewsItem) _then;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? link = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_NewsItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
