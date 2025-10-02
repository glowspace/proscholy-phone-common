import 'package:flutter/material.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/custom_text.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook.dart';
import 'package:proscholy_common/routing/arguments.dart';
import 'package:proscholy_common/utils/extensions.dart';
import 'package:proscholy_common/views/bible_passage.dart';

class RecentItemRow extends StatelessWidget {
  final RecentItem recentItem;

  const RecentItemRow({super.key, required this.recentItem});

  @override
  Widget build(BuildContext context) {
    return HighlightableWidget(
      highlightBackground: true,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 3),
      onTap: () => _push(context),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Icon(recentItem.icon),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
            child: Text(recentItem.title),
          ),
        ),
      ]),
    );
  }

  Future<T?> _push<T>(BuildContext context) => recentItem.map(
        biblePassage: (biblePassage) =>
            context.push('/display', arguments: DisplayScreenArguments.biblePassage(biblePassage)),
        customText: (customText) =>
            context.push('/display', arguments: DisplayScreenArguments.customText(recentItem as CustomText)),
        playlist: (playlist) => context.push('/playlist', arguments: recentItem as Playlist),
        songbook: (songbook) => context.push('/songbook', arguments: recentItem as Songbook),
        songLyric: (songLyric) =>
            context.push('/display', arguments: DisplayScreenArguments.songLyric(recentItem as SongLyric)),
      );
}

extension _RecentItemView on RecentItem {
  IconData get icon => map(
        biblePassage: (_) => Icons.book_outlined,
        customText: (_) => Icons.edit_note,
        playlist: (_) => Icons.playlist_play_rounded,
        songbook: (_) => Icons.book,
        songLyric: (_) => Icons.music_note,
      );

  String get title => map(
        biblePassage: (biblePassage) => biblePassage.name,
        customText: (customText) => customText.name,
        playlist: (playlist) => playlist.name,
        songbook: (songbook) => songbook.name,
        songLyric: (songLyric) => songLyric.name,
      );

  T map<T>({
    required T Function(BiblePassage) biblePassage,
    required T Function(CustomText) customText,
    required T Function(Playlist) playlist,
    required T Function(Songbook) songbook,
    required T Function(SongLyric) songLyric,
  }) =>
      switch (this) {
        BiblePassage value => biblePassage(value),
        CustomText value => customText(value),
        Playlist value => playlist(value),
        Songbook value => songbook(value),
        SongLyric value => songLyric(value),
        _ => throw UnimplementedError('$this is not supported `RecentItem`'),
      };
}
