import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:proscholy_common/components/song_lyric/song_lyrics_section_title.dart';
import 'package:proscholy_common/components/song_lyric/song_lyric_row.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/search_result.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/tag.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/providers/song_lyrics_search.dart';
import 'package:proscholy_common/routing/arguments.dart';
import 'package:proscholy_common/utils/extensions/build_context.dart';

class SongLyricsSearchListView extends StatelessWidget {
  final SongLyricsSearchResult searchResult;

  final List<SongLyric> recentSongLyrics;

  const SongLyricsSearchListView({super.key, required this.searchResult, required this.recentSongLyrics});

  @override
  Widget build(BuildContext context) {
    final searchText = searchResult.searchText.trim();

    final songLyrics = searchResult.songLyrics;
    final matchedById = searchResult.matchedById;
    final matchedBySongbookNumber = searchResult.matchedBySongbookNumber;

    // if any song lyric is matched by id or songbook number show title for remaining results section
    final hasMatchedResults = matchedById != null || (matchedBySongbookNumber.isNotEmpty);
    final showRecentSongLyrics =
        searchText.isEmpty && context.read(selectedTagsProvider).isEmpty && recentSongLyrics.isNotEmpty;

    int itemCount = songLyrics.length;

    if (hasMatchedResults && itemCount > 0) itemCount += 1;

    if (matchedById != null) itemCount += 1;

    if (matchedBySongbookNumber.isNotEmpty) itemCount += matchedBySongbookNumber.length + 1;

    if (showRecentSongLyrics) itemCount += recentSongLyrics.length + 2;

    final selectedTags = context.read(selectedTagsProvider);
    final playlist = selectedTags.length != 1 || selectedTags.firstOrNull?.type != TagType.playlist
        ? null
        : null; // context.read(playlistProvider(selectedTags.first.id - playlistIdOffset));

    return SafeArea(
      bottom: false,
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: (ScrollUpdateNotification notification) {
          if (notification.dragDetails != null) FocusManager.instance.primaryFocus?.unfocus();

          return false;
        },
        child: ListView.builder(
          key: Key('${searchText}_${context.read(selectedTagsProvider).length}'),
          padding: const EdgeInsets.only(top: kDefaultPadding / 3),
          primary: false,
          // TODO: right now this opens keyboard again after pop, see: https://github.com/flutter/flutter/issues/124778
          // using `NotificationListener` to do same functionality
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: itemCount,
          itemBuilder: (_, index) {
            if (showRecentSongLyrics) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: SongLyricsSectionTitle(title: 'Poslední písně'),
                );
              }

              index -= 1;

              if (index < recentSongLyrics.length) {
                return SongLyricRow(
                  songLyric: recentSongLyrics[index],
                  searchText: searchText,
                  displayScreenArguments: DisplayScreenArguments(
                    items: recentSongLyrics,
                    initialIndex: index,
                    showSearchScreen: true,
                    playlist: playlist,
                  ),
                );
              }

              index -= recentSongLyrics.length;
            }

            if (matchedById != null) {
              if (index == 0) return SongLyricRow(songLyric: matchedById, searchText: searchText);

              index -= 1;
            }

            if (matchedBySongbookNumber.isNotEmpty) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: SongLyricsSectionTitle(title: 'Číslo $searchText ve zpěvnících'),
                );
              }

              index -= 1;

              if (index < matchedBySongbookNumber.length) {
                return SongLyricRow(
                  songLyric: matchedBySongbookNumber[index],
                  searchText: searchText,
                  displayScreenArguments: DisplayScreenArguments(
                    items: matchedBySongbookNumber,
                    initialIndex: index,
                    showSearchScreen: true,
                    playlist: playlist,
                  ),
                );
              }

              index -= matchedBySongbookNumber.length;
            }

            if (showRecentSongLyrics) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: SongLyricsSectionTitle(title: 'Všechny písně'),
                );
              }

              index -= 1;
            } else if (hasMatchedResults) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child: SongLyricsSectionTitle(title: 'Ostatní výsledky'),
                );
              }

              index -= 1;
            }

            return SongLyricRow(
              songLyric: songLyrics[index],
              searchText: searchText,
              displayScreenArguments: DisplayScreenArguments(
                items: songLyrics,
                initialIndex: index,
                showSearchScreen: true,
                playlist: playlist,
              ),
            );
          },
        ),
      ),
    );
  }
}
