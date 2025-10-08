// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/songbook_record.dart';

part 'generated/songbook.freezed.dart';
part 'generated/songbook.g.dart';

@freezed
sealed class Songbook extends Model with _$Songbook, RecentItem {
  const Songbook._();

  @Entity(realClass: Songbook)
  const factory Songbook({
    @Id(assignable: true) @JsonKey(fromJson: int.parse) required int id,
    required String name,
    @JsonKey(defaultValue: '') required String shortcut,
    String? color,
    String? colorText,
    required bool isPrivate,
    @Backlink() @JsonKey(fromJson: _songbookRecordsFromJson) required ToMany<SongbookRecord> records,
  }) = _Songbook;

  factory Songbook.fromJson(Map<String, dynamic> json) => _$SongbookFromJson(json);
}

ToMany<SongbookRecord> _songbookRecordsFromJson(List<dynamic>? jsonList) => ToMany();
