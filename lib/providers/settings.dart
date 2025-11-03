import 'dart:convert';

import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/settings.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';

part 'generated/settings.g.dart';

const String _settingsKey = 'settings';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  GlobalSettings build() {
    final prefs = ref.read(appDependenciesProvider).sharedPreferences;
    final settingsData = prefs.getString(_settingsKey);

    listenSelf((_, next) => prefs.setString(_settingsKey, jsonEncode(next)));

    if (settingsData != null) return GlobalSettings.fromJson(jsonDecode(settingsData));

    return defaultGlobalSettings;
  }

  void changeDarkModeEnabled(bool? darkModeEnabled) => state = state.copyWith(darkModeEnabled: darkModeEnabled);

  void changeFontSizeScale(double fontSizeScale) {
    if (fontSizeScale < kMinimumFontSizeScale) {
      fontSizeScale = kMinimumFontSizeScale;
    } else if (fontSizeScale > kMaximumFontSizeScale) {
      fontSizeScale = kMaximumFontSizeScale;
    }

    state = state.copyWith(fontSizeScale: fontSizeScale);
  }

  void changeShowChords(bool showChords) => state = state.copyWith(showChords: showChords);

  void changeShowMusicalNotes(bool showMusicalNotes) => state = state.copyWith(showMusicalNotes: showMusicalNotes);

  void changeAccidentals(int accidentals) => state = state.copyWith(accidentals: accidentals);

  void decreaseAutoScrollSpeedIndex() => state = state.copyWith(autoScrollSpeedIndex: state.autoScrollSpeedIndex - 1);

  void increaseAutoScrollSpeedIndex() => state = state.copyWith(autoScrollSpeedIndex: state.autoScrollSpeedIndex + 1);

  void changeSeedColor(int color) => state = state.copyWith(seedColor: color);

  void reset() => state = defaultGlobalSettings;
}

@riverpod
class SongLyricSettingsNotifier extends _$SongLyricSettingsNotifier {
  SongLyricSettings get _defaultSongLyricSettings =>
      SongLyricSettings.defaultFromGlobalSettings(ref.read(settingsProvider));

  @override
  SongLyricSettings build(int songLyricId) {
    if (songLyricId == 0) return _defaultSongLyricSettings;

    final box = ref.read(appDependenciesProvider).store.box<SongLyricSettings>();

    final query = box.query(SongLyricSettings_.songLyric.equals(songLyricId)).build();

    final songLyricSettings = query.findFirst();

    query.close();

    return songLyricSettings ?? _defaultSongLyricSettings.copyWith(songLyric: ToOne(targetId: songLyricId));
  }

  void changeShowChords(bool showChords) => _updateState(state.copyWith(showChords: showChords));

  void changeShowMusicalNotes(bool showMusicalNotes) =>
      _updateState(state.copyWith(showMusicalNotes: showMusicalNotes));

  void changeAccidentals(int accidentals) => _updateState(state.copyWith(accidentals: accidentals));

  void changeTransposition(int transposition) {
    transposition = state.transposition + transposition;
    if (transposition % 12 == 0) transposition = 0;

    _updateState(state.copyWith(transposition: transposition));
  }

  void reset() => _updateState(_defaultSongLyricSettings);

  void _updateState(SongLyricSettings songLyricSettings) {
    final store = ref.read(appDependenciesProvider).store;
    final songLyricSettingsBox = store.box<SongLyricSettings>();

    if (songLyricSettings == _defaultSongLyricSettings && state != _defaultSongLyricSettings) {
      songLyricSettingsBox.remove(state.id);
    } else {
      // decide id for new objects
      if (songLyricSettings.id == 0) {
        songLyricSettings = songLyricSettings.copyWith(id: store.box<SongLyricSettings>().nextId(SongLyricSettings_.id));
      }

      songLyricSettingsBox.put(songLyricSettings);
    }

    state = songLyricSettings;
  }
}
