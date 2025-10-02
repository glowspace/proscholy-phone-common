import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/presentation.freezed.dart';
part 'generated/presentation.g.dart';

const defaultPresentationData = PresentationData(
  songLyricId: null,
  name: '',
  text: '',
  settings: defaultPresentationSettings,
);

const defaultPresentationSettings = PresentationSettings(
  darkMode: true,
  showName: false,
  allCapital: false,
  isVisible: true,
);

enum PresentationAlignment { top, center, bottom }

@Freezed(toJson: true)
sealed class PresentationData with _$PresentationData {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory PresentationData({
    int? songLyricId,
    @Default(false) bool isCustomText,
    required String name,
    required String text,
    required PresentationSettings settings,
  }) = _PresentationData;

  factory PresentationData.fromJson(Map<String, Object?> json) => _$PresentationDataFromJson(json);
}

@Freezed(toJson: true)
sealed class PresentationSettings with _$PresentationSettings {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory PresentationSettings({
    required bool darkMode,
    required bool showName,
    required bool allCapital,
    required bool isVisible,
    PresentationAlignment? alignment,
  }) = _PresentationSettings;

  factory PresentationSettings.fromJson(Map<String, Object?> json) => _$PresentationSettingsFromJson(json);
}
