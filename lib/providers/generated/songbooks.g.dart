// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../songbooks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PinnedSongbookIdsNotifier)
const pinnedSongbookIdsProvider = PinnedSongbookIdsNotifierProvider._();

final class PinnedSongbookIdsNotifierProvider
    extends $NotifierProvider<PinnedSongbookIdsNotifier, List<int>> {
  const PinnedSongbookIdsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinnedSongbookIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinnedSongbookIdsNotifierHash();

  @$internal
  @override
  PinnedSongbookIdsNotifier create() => PinnedSongbookIdsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }
}

String _$pinnedSongbookIdsNotifierHash() =>
    r'b510cfea8df3fe03b4dbe5e06df96e46690166ec';

abstract class _$PinnedSongbookIdsNotifier extends $Notifier<List<int>> {
  List<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<int>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<int>, List<int>>,
              List<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(songbooks)
const songbooksProvider = SongbooksProvider._();

final class SongbooksProvider
    extends $FunctionalProvider<List<Songbook>, List<Songbook>, List<Songbook>>
    with $Provider<List<Songbook>> {
  const SongbooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songbooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songbooksHash();

  @$internal
  @override
  $ProviderElement<List<Songbook>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Songbook> create(Ref ref) {
    return songbooks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Songbook> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Songbook>>(value),
    );
  }
}

String _$songbooksHash() => r'f89198f330e9c4f481b4eea9531201cf2bac43bd';
