import 'dart:math';

import 'package:collection/collection.dart';
import 'package:proscholy_common/providers/recent_items.dart';
import 'package:proscholy_common/providers/svgs.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:proscholy_common/views/song_lyric.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/sort.dart';

part 'generated/song_lyrics.g.dart';

const int _maxRecentSongLyrics = 5;
const String _recentSongLyricsKey = 'recent_song_lyrics';

@riverpod
SongLyric? songLyric(Ref ref, int id) {
  if (id == 0) return null;

  return ref.read(appDependenciesProvider).store.box<SongLyric>().get(id);
}

@Riverpod(keepAlive: true)
List<SongLyric> songLyrics(Ref ref) {
  final random = Random();
  final songLyrics = ref.watch(appDependenciesProvider).store.query(orderBy: SongLyric_.name)
      .where((songLyric) => songLyric.shouldAppearToUser || ref.read(svgProvider(songLyric.id)).isNotEmpty)
      .toList();

  return switch (ref.watch(sortProvider)) {
    SortType.random => songLyrics..sort((_, __) => random.nextDouble().compareTo(random.nextDouble())),
    SortType.alpha => songLyrics..sort((a, b) => a.name.compareTo(b.name)),
    SortType.numeric => songLyrics..sort((a, b) => compareNatural(a.displayId, b.displayId)),
  };
}

@riverpod
class RecentSongLyrics extends _$RecentSongLyrics {
  @override
  List<SongLyric> build() {
    final appDependencies = ref.read(appDependenciesProvider);
    final ids = (appDependencies.sharedPreferences.getStringList(_recentSongLyricsKey) ?? [])
        .map((id) => int.parse(id))
        .toList();

    return appDependencies.store.box<SongLyric>().getMany(ids).nonNulls.toList();
  }

  void add(SongLyric songLyric) {
    final songLyrics = [
      songLyric,
      for (final recentSongLyric in state)
        if (recentSongLyric != songLyric) recentSongLyric,
    ];

    if (songLyrics.length > _maxRecentSongLyrics) songLyrics.removeLast();

    ref
        .read(appDependenciesProvider)
        .sharedPreferences
        .setStringList(_recentSongLyricsKey, songLyrics.map((songLyric) => '${songLyric.id}').toList());

    ref.read(recentItemsProvider.notifier).add(songLyric);

    state = songLyrics;
  }
}
