// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../song_lyrics_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Sort)
const sortProvider = SortProvider._();

final class SortProvider extends $NotifierProvider<Sort, SortType> {
  const SortProvider._()
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
  String debugGetCreateSourceHash() => _$sortHash();

  @$internal
  @override
  Sort create() => Sort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortType>(value),
    );
  }
}

String _$sortHash() => r'ddf89b3ee4e872a2ab193d66d217282e33f13560';

abstract class _$Sort extends $Notifier<SortType> {
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

@ProviderFor(_songLyrics)
const _songLyricsProvider = _SongLyricsProvider._();

final class _SongLyricsProvider
    extends
        $FunctionalProvider<List<SongLyric>, List<SongLyric>, List<SongLyric>>
    with $Provider<List<SongLyric>> {
  const _SongLyricsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_songLyricsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_songLyricsHash();

  @$internal
  @override
  $ProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SongLyric> create(Ref ref) {
    return _songLyrics(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SongLyric> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SongLyric>>(value),
    );
  }
}

String _$_songLyricsHash() => r'3ef08658346f95813927ac249db9c5bdf438dbc0';

@ProviderFor(songLyrics)
const songLyricsProvider = SongLyricsProvider._();

final class SongLyricsProvider
    extends
        $FunctionalProvider<List<SongLyric>, List<SongLyric>, List<SongLyric>>
    with $Provider<List<SongLyric>> {
  const SongLyricsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'songLyricsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$songLyricsHash();

  @$internal
  @override
  $ProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SongLyric> create(Ref ref) {
    return songLyrics(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SongLyric> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SongLyric>>(value),
    );
  }
}

String _$songLyricsHash() => r'5d809c061b59705c0ab92d7b7c3cf5c7f1e37267';

@ProviderFor(SongLyricsSearch)
const songLyricsSearchProvider = SongLyricsSearchProvider._();

final class SongLyricsSearchProvider
    extends $NotifierProvider<SongLyricsSearch, SongLyricsSearchResult> {
  const SongLyricsSearchProvider._()
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
  String debugGetCreateSourceHash() => _$songLyricsSearchHash();

  @$internal
  @override
  SongLyricsSearch create() => SongLyricsSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongLyricsSearchResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongLyricsSearchResult>(value),
    );
  }
}

String _$songLyricsSearchHash() => r'58ad9a1b40ca975a68bdc8408fb5c9c8b9d9301b';

abstract class _$SongLyricsSearch extends $Notifier<SongLyricsSearchResult> {
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

@ProviderFor(SelectedTags)
const selectedTagsProvider = SelectedTagsProvider._();

final class SelectedTagsProvider
    extends $NotifierProvider<SelectedTags, List<Tag>> {
  const SelectedTagsProvider._()
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
  String debugGetCreateSourceHash() => _$selectedTagsHash();

  @$internal
  @override
  SelectedTags create() => SelectedTags();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Tag> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Tag>>(value),
    );
  }
}

String _$selectedTagsHash() => r'5a287c290903dc4172dd2321b6fa5c015ee0259d';

abstract class _$SelectedTags extends $Notifier<List<Tag>> {
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

@ProviderFor(SongLyricsSearchFiltered)
const songLyricsSearchFilteredProvider = SongLyricsSearchFilteredProvider._();

final class SongLyricsSearchFilteredProvider
    extends
        $NotifierProvider<SongLyricsSearchFiltered, SongLyricsSearchResult> {
  const SongLyricsSearchFilteredProvider._()
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
  String debugGetCreateSourceHash() => _$songLyricsSearchFilteredHash();

  @$internal
  @override
  SongLyricsSearchFiltered create() => SongLyricsSearchFiltered();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongLyricsSearchResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongLyricsSearchResult>(value),
    );
  }
}

String _$songLyricsSearchFilteredHash() =>
    r'9e2c1cec4fc69bf684971eebb723a16f90b2d6b3';

abstract class _$SongLyricsSearchFiltered
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
