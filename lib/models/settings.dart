import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/song_lyric.dart';

part 'generated/settings.freezed.dart';
part 'generated/settings.g.dart';

// in ms per pixel
const autoScrollSpeeds = [120, 90, 72, 60, 54, 45, 39, 36, 33, 30, 27, 24];

const defaultGlobalSettings = GlobalSettings(
  seedColor: isZP ? 0xFF673AB7 : 0xFF2196F3, // Colors.deepPurlple
  fontSizeScale: 1,
  showChords: true,
  showMusicalNotes: true,
  accidentals: 0,
  autoScrollSpeedIndex: 6,
);

@freezed
sealed class GlobalSettings with _$GlobalSettings {
  const factory GlobalSettings({
    bool? darkModeEnabled,
    required int seedColor,
    required double fontSizeScale,
    required bool showChords,
    required bool showMusicalNotes,
    required int accidentals,
    required int autoScrollSpeedIndex,
  }) = _GlobalSettings;

  factory GlobalSettings.fromJson(Map<String, Object?> json) => _$GlobalSettingsFromJson(json);
}

@Freezed(equal: false)
sealed class SongLyricSettingsModel with _$SongLyricSettingsModel implements Identifiable {
  const SongLyricSettingsModel._();

  @Entity(realClass: SongLyricSettingsModel)
  const factory SongLyricSettingsModel({
    @Id(assignable: true) required int id,
    required bool showChords,
    required bool showMusicalNotes,
    int? accidentals,
    required int transposition,
    required ToOne<SongLyric> songLyric,
  }) = _SongLyricSettingsModel;

  factory SongLyricSettingsModel.defaultFromGlobalSettings(GlobalSettings globalSettings) {
    return SongLyricSettingsModel(
      id: 0,
      showChords: globalSettings.showChords,
      showMusicalNotes: globalSettings.showMusicalNotes,
      transposition: 0,
      songLyric: ToOne(),
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is SongLyricSettingsModel && id == other.id;
}
