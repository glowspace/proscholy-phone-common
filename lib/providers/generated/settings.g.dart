// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingsNotifier)
const settingsProvider = SettingsNotifierProvider._();

final class SettingsNotifierProvider
    extends $NotifierProvider<SettingsNotifier, GlobalSettings> {
  const SettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsNotifierHash();

  @$internal
  @override
  SettingsNotifier create() => SettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalSettings>(value),
    );
  }
}

String _$settingsNotifierHash() => r'1f0605f7d380919f49dfb5dc584979aafe7c15f7';

abstract class _$SettingsNotifier extends $Notifier<GlobalSettings> {
  GlobalSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GlobalSettings, GlobalSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GlobalSettings, GlobalSettings>,
              GlobalSettings,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SongLyricSettingsNotifier)
const songLyricSettingsProvider = SongLyricSettingsNotifierFamily._();

final class SongLyricSettingsNotifierProvider
    extends $NotifierProvider<SongLyricSettingsNotifier, SongLyricSettings> {
  const SongLyricSettingsNotifierProvider._({
    required SongLyricSettingsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'songLyricSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$songLyricSettingsNotifierHash();

  @override
  String toString() {
    return r'songLyricSettingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SongLyricSettingsNotifier create() => SongLyricSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongLyricSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongLyricSettings>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SongLyricSettingsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songLyricSettingsNotifierHash() =>
    r'37d773d80c0746708d2ce7b728b6c1fe8d1dee18';

final class SongLyricSettingsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SongLyricSettingsNotifier,
          SongLyricSettings,
          SongLyricSettings,
          SongLyricSettings,
          int
        > {
  const SongLyricSettingsNotifierFamily._()
    : super(
        retry: null,
        name: r'songLyricSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SongLyricSettingsNotifierProvider call(int songLyricId) =>
      SongLyricSettingsNotifierProvider._(argument: songLyricId, from: this);

  @override
  String toString() => r'songLyricSettingsProvider';
}

abstract class _$SongLyricSettingsNotifier
    extends $Notifier<SongLyricSettings> {
  late final _$args = ref.$arg as int;
  int get songLyricId => _$args;

  SongLyricSettings build(int songLyricId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<SongLyricSettings, SongLyricSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SongLyricSettings, SongLyricSettings>,
              SongLyricSettings,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
