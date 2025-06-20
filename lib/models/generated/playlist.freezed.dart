// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Playlist {
  @Id(assignable: true)
  int get id;
  @Unique(onConflict: ConflictStrategy.fail)
  String get name;
  int get rank;
  @Backlink()
  ToMany<PlaylistRecord> get records;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistCopyWith<Playlist> get copyWith =>
      _$PlaylistCopyWithImpl<Playlist>(this as Playlist, _$identity);

  @override
  String toString() {
    return 'Playlist(id: $id, name: $name, rank: $rank, records: $records)';
  }
}

/// @nodoc
abstract mixin class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) _then) =
      _$PlaylistCopyWithImpl;
  @useResult
  $Res call(
      {@Id(assignable: true) int id,
      @Unique(onConflict: ConflictStrategy.fail) String name,
      int rank,
      @Backlink() ToMany<PlaylistRecord> records});
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res> implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._self, this._then);

  final Playlist _self;
  final $Res Function(Playlist) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rank = null,
    Object? records = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      records: null == records
          ? _self.records
          : records // ignore: cast_nullable_to_non_nullable
              as ToMany<PlaylistRecord>,
    ));
  }
}

/// @nodoc

@Entity(realClass: Playlist)
class _Playlist extends Playlist {
  const _Playlist(
      {@Id(assignable: true) required this.id,
      @Unique(onConflict: ConflictStrategy.fail) required this.name,
      required this.rank,
      @Backlink() required this.records})
      : super._();

  @override
  @Id(assignable: true)
  final int id;
  @override
  @Unique(onConflict: ConflictStrategy.fail)
  final String name;
  @override
  final int rank;
  @override
  @Backlink()
  final ToMany<PlaylistRecord> records;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistCopyWith<_Playlist> get copyWith =>
      __$PlaylistCopyWithImpl<_Playlist>(this, _$identity);

  @override
  String toString() {
    return 'Playlist(id: $id, name: $name, rank: $rank, records: $records)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$PlaylistCopyWith(_Playlist value, $Res Function(_Playlist) _then) =
      __$PlaylistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int id,
      @Unique(onConflict: ConflictStrategy.fail) String name,
      int rank,
      @Backlink() ToMany<PlaylistRecord> records});
}

/// @nodoc
class __$PlaylistCopyWithImpl<$Res> implements _$PlaylistCopyWith<$Res> {
  __$PlaylistCopyWithImpl(this._self, this._then);

  final _Playlist _self;
  final $Res Function(_Playlist) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rank = null,
    Object? records = null,
  }) {
    return _then(_Playlist(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      records: null == records
          ? _self.records
          : records // ignore: cast_nullable_to_non_nullable
              as ToMany<PlaylistRecord>,
    ));
  }
}

// dart format on
