import 'package:proscholy_common/providers/recent_items.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';

part 'generated/song_lyrics.g.dart';

const int _maxRecentSongLyrics = 5;
const String _recentSongLyricsKey = 'recent_song_lyrics';

@riverpod
SongLyric? songLyric(Ref ref, int id) {
  if (id == 0) return null;

  return ref.read(appDependenciesProvider).store.box<SongLyric>().get(id);
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
