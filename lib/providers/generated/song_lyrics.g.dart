// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../song_lyrics.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(songLyric)
const songLyricProvider = SongLyricFamily._();

final class SongLyricProvider
    extends $FunctionalProvider<SongLyric?, SongLyric?, SongLyric?>
    with $Provider<SongLyric?> {
  const SongLyricProvider._(
      {required SongLyricFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'songLyricProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$songLyricHash();

  @override
  String toString() {
    return r'songLyricProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SongLyric?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SongLyric? create(Ref ref) {
    final argument = this.argument as int;
    return songLyric(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SongLyric? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SongLyric?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SongLyricProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songLyricHash() => r'cc851ffdfc3ce3c5239ce1f07bea15b9359e4f27';

final class SongLyricFamily extends $Family
    with $FunctionalFamilyOverride<SongLyric?, int> {
  const SongLyricFamily._()
      : super(
          retry: null,
          name: r'songLyricProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SongLyricProvider call(
    int id,
  ) =>
      SongLyricProvider._(argument: id, from: this);

  @override
  String toString() => r'songLyricProvider';
}

@ProviderFor(songLyrics)
const songLyricsProvider = SongLyricsProvider._();

final class SongLyricsProvider extends $FunctionalProvider<List<SongLyric>,
    List<SongLyric>, List<SongLyric>> with $Provider<List<SongLyric>> {
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

String _$songLyricsHash() => r'b24a72d219c4ada10938de8b6135aab500e3f41f';

@ProviderFor(songsListSongLyrics)
const songsListSongLyricsProvider = SongsListSongLyricsFamily._();

final class SongsListSongLyricsProvider extends $FunctionalProvider<
    List<SongLyric>,
    List<SongLyric>,
    List<SongLyric>> with $Provider<List<SongLyric>> {
  const SongsListSongLyricsProvider._(
      {required SongsListSongLyricsFamily super.from,
      required SongsList super.argument})
      : super(
          retry: null,
          name: r'songsListSongLyricsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$songsListSongLyricsHash();

  @override
  String toString() {
    return r'songsListSongLyricsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SongLyric> create(Ref ref) {
    final argument = this.argument as SongsList;
    return songsListSongLyrics(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SongLyric> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SongLyric>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SongsListSongLyricsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songsListSongLyricsHash() =>
    r'5efbca6a484f513653ec5de22242a9bf34f6c122';

final class SongsListSongLyricsFamily extends $Family
    with $FunctionalFamilyOverride<List<SongLyric>, SongsList> {
  const SongsListSongLyricsFamily._()
      : super(
          retry: null,
          name: r'songsListSongLyricsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SongsListSongLyricsProvider call(
    SongsList songsList,
  ) =>
      SongsListSongLyricsProvider._(argument: songsList, from: this);

  @override
  String toString() => r'songsListSongLyricsProvider';
}

@ProviderFor(RecentSongLyrics)
const recentSongLyricsProvider = RecentSongLyricsProvider._();

final class RecentSongLyricsProvider
    extends $NotifierProvider<RecentSongLyrics, List<SongLyric>> {
  const RecentSongLyricsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentSongLyricsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentSongLyricsHash();

  @$internal
  @override
  RecentSongLyrics create() => RecentSongLyrics();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SongLyric> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SongLyric>>(value),
    );
  }
}

String _$recentSongLyricsHash() => r'1e35b9efc5d0fd755363fb702944271d6e13ee78';

abstract class _$RecentSongLyrics extends $Notifier<List<SongLyric>> {
  List<SongLyric> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<SongLyric>, List<SongLyric>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<SongLyric>, List<SongLyric>>,
        List<SongLyric>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
