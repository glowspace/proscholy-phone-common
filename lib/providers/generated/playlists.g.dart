// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../playlists.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(favoritePlaylist)
const favoritePlaylistProvider = FavoritePlaylistProvider._();

final class FavoritePlaylistProvider
    extends $FunctionalProvider<Playlist, Playlist, Playlist>
    with $Provider<Playlist> {
  const FavoritePlaylistProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritePlaylistProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritePlaylistHash();

  @$internal
  @override
  $ProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Playlist create(Ref ref) {
    return favoritePlaylist(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Playlist value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Playlist>(value),
    );
  }
}

String _$favoritePlaylistHash() => r'dfe94b6c75bb3cfd09516fac9736fdf0af014456';

@ProviderFor(PlaylistNotifier)
const playlistProvider = PlaylistNotifierFamily._();

final class PlaylistNotifierProvider
    extends $NotifierProvider<PlaylistNotifier, Playlist> {
  const PlaylistNotifierProvider._({
    required PlaylistNotifierFamily super.from,
    required Playlist super.argument,
  }) : super(
         retry: null,
         name: r'playlistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistNotifierHash();

  @override
  String toString() {
    return r'playlistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlaylistNotifier create() => PlaylistNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Playlist value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Playlist>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistNotifierHash() => r'19e32e4b1a81f5d0522ce69309f31a8c603a2102';

final class PlaylistNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaylistNotifier,
          Playlist,
          Playlist,
          Playlist,
          Playlist
        > {
  const PlaylistNotifierFamily._()
    : super(
        retry: null,
        name: r'playlistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistNotifierProvider call(Playlist playlist) =>
      PlaylistNotifierProvider._(argument: playlist, from: this);

  @override
  String toString() => r'playlistProvider';
}

abstract class _$PlaylistNotifier extends $Notifier<Playlist> {
  late final _$args = ref.$arg as Playlist;
  Playlist get playlist => _$args;

  Playlist build(Playlist playlist);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Playlist, Playlist>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Playlist, Playlist>,
              Playlist,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PlaylistsNotifier)
const playlistsProvider = PlaylistsNotifierProvider._();

final class PlaylistsNotifierProvider
    extends $NotifierProvider<PlaylistsNotifier, List<Playlist>> {
  const PlaylistsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistsNotifierHash();

  @$internal
  @override
  PlaylistsNotifier create() => PlaylistsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Playlist> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Playlist>>(value),
    );
  }
}

String _$playlistsNotifierHash() => r'6dc209db5bf39ff8df399c29e303e8be6b382abb';

abstract class _$PlaylistsNotifier extends $Notifier<List<Playlist>> {
  List<Playlist> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Playlist>, List<Playlist>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Playlist>, List<Playlist>>,
              List<Playlist>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
