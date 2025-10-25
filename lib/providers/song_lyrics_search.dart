import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/search_result.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/tag.dart';
import 'package:proscholy_common/providers/comparators/songbook.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/song_lyrics.dart';
import 'package:proscholy_common/providers/songbooks.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:proscholy_common/views/playlist.dart';
import 'package:proscholy_common/views/song_lyric.dart';
import 'package:proscholy_common/views/songbook.dart';
import 'package:proscholy_common/views/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'generated/song_lyrics_search.g.dart';

const String _sortTypeKey = 'sort_type';

final RegExp _songbookRecordNumberRE = RegExp(r'([a-zA-Z]*)\s*([1-9][0-9]*[a-zA-Z]?)');

enum SortType { random, alpha, numeric }

@riverpod
class Sort extends _$Sort {
  @override
  SortType build() {
    final prefs = ref.read(appDependenciesProvider).sharedPreferences;
    final sortTypeValue = prefs.getInt(_sortTypeKey);

    listenSelf((_, next) => prefs.setInt(_sortTypeKey, next.index));

    if (sortTypeValue != null) return SortType.values[sortTypeValue];

    return SortType.random;
  }

  void change(SortType sortType) => state = sortType;
}

// helper provider, so the song lyrics don't have to be always loaded from database when sorting changes
@Riverpod(keepAlive: true)
List<SongLyric> _songLyrics(Ref ref) {
  final songLyrics = ref.read(appDependenciesProvider).store.box<SongLyric>().getAll();
  // .where((songLyric) => songLyric.shouldAppearToUser || ref.read(svgProvider(songLyric.id)).isNotEmpty)

  return songLyrics;
}

@Riverpod(keepAlive: true)
List<SongLyric> songLyrics(Ref ref) {
  final random = Random();
  final songLyrics = ref.watch(_songLyricsProvider);

  return switch (ref.watch(sortProvider)) {
    SortType.random => songLyrics.sorted((_, _) => random.nextInt(3) - 1),
    SortType.alpha => songLyrics.sorted((a, b) => a.name.compareTo(b.name)),
    SortType.numeric => songLyrics.sorted((a, b) => compareNatural(a.displayId, b.displayId)),
  };
}

@riverpod
class SongLyricsSearch extends _$SongLyricsSearch {
  @override
  SongLyricsSearchResult build() {
    return SongLyricsSearchResult(songLyrics: ref.watch(songLyricsProvider));
  }

  Future<void> searchTextChanged(String value) async {
    if (value.trim().isEmpty) {
      state = SongLyricsSearchResult(songLyrics: ref.watch(songLyricsProvider));

      return;
    }

    state = state.copyWith(searchText: value);

    final matchedSongLyricId = _updateMatchedById();
    final matchedSongLyricIds = _updateMatchedBySongbookNumber();

    if (matchedSongLyricId != null) matchedSongLyricIds.add(matchedSongLyricId);

    final songLyrics = await ref.read(appDependenciesProvider).ftsSearch.search(value, ignore: matchedSongLyricIds);

    // update state only if the result is still relevant
    if (value == state.searchText) state = state.copyWith(songLyrics: songLyrics ?? ref.watch(songLyricsProvider));
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
    final songbookRecordNumberMatch = _songbookRecordNumberRE.firstMatch(state.searchText.trim());

    if (songbookRecordNumberMatch == null) return <int>{};

    final songbookShortcut = songbookRecordNumberMatch.group(1)!.capitalize;
    final songbookRecordNumber = songbookRecordNumberMatch.group(2)!.capitalize;

    final songbookRecords = ref
        .read(appDependenciesProvider)
        .store
        .query(condition: SongbookRecord_.number.equals(songbookRecordNumber))
        .where(
          (songbookRecord) =>
              songbookShortcut.isEmpty || songbookRecord.songbook.target!.shortcut.capitalize == songbookShortcut,
        )
        .toList();
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

@riverpod
class SelectedTags extends _$SelectedTags {
  final List<Tag>? initialSelectedTags;

  SelectedTags({this.initialSelectedTags});

  @override
  List<Tag> build() => initialSelectedTags ?? [];

  void toggle(Tag tag) {
    final tags = state;

    if (tags.remove(tag)) {
      state = [...tags];
    } else {
      state = [tag, ...tags];
    }
  }
}

@riverpod
class SongLyricsSearchFiltered extends _$SongLyricsSearchFiltered {
  @override
  SongLyricsSearchResult build() {
    final unfilteredResult = ref.watch(songLyricsSearchProvider);
    final selectedTags = ref.watch(selectedTagsProvider);

    if (selectedTags.isEmpty) return unfilteredResult;

    final selectedTagsByTagType = groupBy(selectedTags, (Tag tag) => tag.type);

    if (unfilteredResult.searchText.isEmpty && selectedTags.length == 1) {
      final tag = selectedTags.first;

      if (tag.type == TagType.songbook) {
        final songbook = ref.read(songbookProvider(songbookIdOffset - tag.id))!;

        return unfilteredResult.copyWith(songLyrics: songbook.songLyrics);
      } else if (tag.type == TagType.playlist) {
        final playlist = ref.read(playlistProvider(playlistIdOffset - tag.id))!;

        return unfilteredResult.copyWith(songLyrics: playlist.songLyrics);
      }
    }

    SongLyric? matchedById = unfilteredResult.matchedById;
    if (matchedById != null && !_matchesSelectedTags(matchedById, selectedTagsByTagType)) matchedById = null;

    final songLyrics = unfilteredResult.songLyrics
        .where((songLyric) => _matchesSelectedTags(songLyric, selectedTagsByTagType))
        .toList();
    final matchedBySongbookNumber = unfilteredResult.matchedBySongbookNumber
        .where((songLyric) => _matchesSelectedTags(songLyric, selectedTagsByTagType))
        .toList();

    return unfilteredResult.copyWith(
      songLyrics: songLyrics,
      matchedById: matchedById,
      matchedBySongbookNumber: matchedBySongbookNumber,
    );
  }

  bool _matchesSelectedTags(SongLyric songLyric, Map<TagType, List<Tag>> selectedTagsByTagType) {
    for (final tagType in supportedTagTypes) {
      final selectedTags = selectedTagsByTagType[tagType];

      if (selectedTags == null || selectedTags.isEmpty) continue;

      final matches = switch (tagType) {
        TagType.language => selectedTags.any((tag) => tag.name == songLyric.langDescription),
        TagType.playlist => selectedTags.any(
          (tag) => songLyric.playlistRecords
              .map((playlistRecord) => playlistRecord.playlist.target!)
              .any((playlist) => tag.name == playlist.name),
        ),
        TagType.songbook => selectedTags.any(
          (tag) => songLyric.songbookRecords
              .map((songbookRecord) => songbookRecord.songbook.target!)
              .any((songbook) => tag.name == songbook.name),
        ),
        _ => songLyric.tags.none((tag) => selectedTags.contains(tag)),
      };

      if (!matches) return false;
    }

    return true;
  }
}
