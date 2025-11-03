// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../song_lyrics_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SortNotifier)
const sortProvider = SortNotifierProvider._();

final class SortNotifierProvider
    extends $NotifierProvider<SortNotifier, SortType> {
  const SortNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortNotifierHash();

  @$internal
  @override
  SortNotifier create() => SortNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortType>(value),
    );
  }
}

String _$sortNotifierHash() => r'6835ea0d4094153fa2076f4dbedd1525d2a6dadd';

abstract class _$SortNotifier extends $Notifier<SortType> {
  SortType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SortType, SortType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SortType, SortType>,
              SortType,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(songLyricsSorted)
const songLyricsSortedProvider = SongLyricsSortedProvider._();

final class SongLyricsSortedProvider
    extends
        $FunctionalProvider<List<SongLyric>, List<SongLyric>, List<SongLyric>>
    with $Provider<List<SongLyric>> {
  const SongLyricsSortedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songLyricsSortedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songLyricsSortedHash();

  @$internal
  @override
  $ProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SongLyric> create(Ref ref) {
    return songLyricsSorted(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SongLyric> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SongLyric>>(value),
    );
  }
}

String _$songLyricsSortedHash() => r'f38b3857eeea873f6a078b043eb882e96f6f3ed4';

@ProviderFor(SongLyricsSearchNotifier)
const songLyricsSearchProvider = SongLyricsSearchNotifierProvider._();

final class SongLyricsSearchNotifierProvider
    extends
        $NotifierProvider<SongLyricsSearchNotifier, SongLyricsSearchResult> {
  const SongLyricsSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songLyricsSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songLyricsSearchNotifierHash();

  @$internal
  @override
  SongLyricsSearchNotifier create() => SongLyricsSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongLyricsSearchResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongLyricsSearchResult>(value),
    );
  }
}

String _$songLyricsSearchNotifierHash() =>
    r'5b249f3a05405c5273a50b2bc9ba35aa8cb841a7';

abstract class _$SongLyricsSearchNotifier
    extends $Notifier<SongLyricsSearchResult> {
  SongLyricsSearchResult build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SongLyricsSearchResult, SongLyricsSearchResult>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SongLyricsSearchResult, SongLyricsSearchResult>,
              SongLyricsSearchResult,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SelectedTagsNotifier)
const selectedTagsProvider = SelectedTagsNotifierProvider._();

final class SelectedTagsNotifierProvider
    extends $NotifierProvider<SelectedTagsNotifier, List<Tag>> {
  const SelectedTagsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTagsNotifierHash();

  @$internal
  @override
  SelectedTagsNotifier create() => SelectedTagsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Tag> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Tag>>(value),
    );
  }
}

String _$selectedTagsNotifierHash() =>
    r'dc7f22600784db9f75d605cd9d3703b299975d7e';

abstract class _$SelectedTagsNotifier extends $Notifier<List<Tag>> {
  List<Tag> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Tag>, List<Tag>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Tag>, List<Tag>>,
              List<Tag>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SongLyricsSearchFilteredNotifier)
const songLyricsSearchFilteredProvider =
    SongLyricsSearchFilteredNotifierProvider._();

final class SongLyricsSearchFilteredNotifierProvider
    extends
        $NotifierProvider<
          SongLyricsSearchFilteredNotifier,
          SongLyricsSearchResult
        > {
  const SongLyricsSearchFilteredNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songLyricsSearchFilteredProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songLyricsSearchFilteredNotifierHash();

  @$internal
  @override
  SongLyricsSearchFilteredNotifier create() =>
      SongLyricsSearchFilteredNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongLyricsSearchResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongLyricsSearchResult>(value),
    );
  }
}

String _$songLyricsSearchFilteredNotifierHash() =>
    r'8be4ae4a80d017dadd05d06c596d565d2e97a692';

abstract class _$SongLyricsSearchFilteredNotifier
    extends $Notifier<SongLyricsSearchResult> {
  SongLyricsSearchResult build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SongLyricsSearchResult, SongLyricsSearchResult>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SongLyricsSearchResult, SongLyricsSearchResult>,
              SongLyricsSearchResult,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
