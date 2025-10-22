import 'dart:math';

import 'package:collection/collection.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/search_result.dart';
import 'package:proscholy_common/providers/comparators/songbook.dart';
import 'package:proscholy_common/providers/recent_items.dart';
import 'package:proscholy_common/providers/songbooks.dart';
import 'package:proscholy_common/providers/svgs.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:proscholy_common/views/song_lyric.dart';
import 'package:proscholy_common/views/songbook.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/sort.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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

@riverpod
class SongLyricsSearch extends _$SongLyricsSearch {
  @override
  SongLyricsSearchResult build() {
    final allSongLyrics = ref.watch(songLyricsProvider);

    return SongLyricsSearchResult(songLyrics: allSongLyrics);
  }

  Future<void> searchTextChanged(String value) async {
    state = state.copyWith(searchText: value);

    final matchedSongLyricId = _updateMatchedById();
    final matchedSongLyricIds = _updateMatchedBySongbookNumber();

    if (matchedSongLyricId != null) matchedSongLyricIds.add(matchedSongLyricId);

    final songLyrics = await ref.read(appDependenciesProvider).ftsSearch.search(value, ignore: matchedSongLyricIds);

    // update state only if the result is still relevant
    if (value == state.searchText) {
      state = state.copyWith(songLyrics: songLyrics ?? ref.watch(songLyricsProvider));
    }
  }

  int? _updateMatchedById() {
    final number = int.tryParse(state.searchText.trim());

    if (number == null) {
      state = state.copyWith(matchedById: null);

      return null;
    }

    // EZ and EK use songbook record number as id, so it will be potentialy set in `_updateMatchedBySongbookNumber` function
    if (isZPS) {
      state = state.copyWith(matchedById: ref.read(songLyricProvider(number)));

      return number;
    }

    return number;
  }

  Set<int> _updateMatchedBySongbookNumber() {
    final songbookRecords = ref
        .read(appDependenciesProvider)
        .store
        .query(condition: SongbookRecord_.number.equals(state.searchText.trim()));
    final pinnedSongbookIds = ref.read(pinnedSongbookIdsProvider);

    songbookRecords.sort((a, b) => compareSongbooks(a.songbook.target!, b.songbook.target!, pinnedSongbookIds));

    final songLyricIds = <int>{};
    final matchedBySongbookNumber = <SongLyric>[];

    for (final songbookRecord in songbookRecords) {
      final songLyric = ref.read(songLyricProvider(songbookRecord.songLyric.targetId));

      if (songLyric == null) {
        Sentry.captureMessage('missing song lyric from songbook record: $songbookRecord');

        continue;
      }

      songLyricIds.add(songLyric.id);

      if ((isEZ && songbookRecord.songbook.target!.isEZ) || (isEK && songbookRecord.songbook.target!.isEK)) {
        state = state.copyWith(matchedById: songLyric);
      } else {
        matchedBySongbookNumber.add(songLyric);
      }
    }

    state = state.copyWith(matchedBySongbookNumber: matchedBySongbookNumber);

    return songLyricIds;
  }

}
