// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/models/model.dart';

part 'generated/external.freezed.dart';
part 'generated/external.g.dart';

enum MediaType {
  spotify,
  soundcloud,
  youtube,
  mp3,
  pdf,
  jpg,
  unsupported;

  factory MediaType.fromRawValue(int rawValue) => switch (rawValue) {
        0 => MediaType.spotify,
        1 => MediaType.soundcloud,
        2 => MediaType.youtube,
        3 => MediaType.mp3,
        4 => MediaType.pdf,
        5 => MediaType.jpg,
        _ => MediaType.unsupported,
      };

  static int rawValueFromString(String? string) => switch (string) {
        "spotify" => 0,
        "soundcloud" => 1,
        "youtube" => 2,
        "file/mp3" => 3,
        "file/pdf" => 4,
        "file/jpg" => 5,
        _ => -1,
      };
}

@freezed
sealed class External extends Model with _$External {
  const External._();

  @Entity(realClass: External)
  const factory External({
    @Id(assignable: true) @JsonKey(fromJson: int.parse) required int id,
    required String publicName,
    String? mediaId,
    String? url,
    @JsonKey(name: 'media_type', fromJson: MediaType.rawValueFromString) required int dbMediaType,
  }) = _External;

  factory External.fromJson(Map<String, dynamic> json) => _$ExternalFromJson(json);

  MediaType get mediaType => MediaType.fromRawValue(dbMediaType);
}
