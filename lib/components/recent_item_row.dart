import 'package:flutter/material.dart';
import 'package:proscholy_common/components/highlightable_widget.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/routing/arguments.dart';
import 'package:proscholy_common/utils/extensions.dart';
import 'package:proscholy_common/views/recent_item.dart';

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
        userText: (userText) => context.push('/display', arguments: DisplayScreenArguments.userText(userText)),
        playlist: (playlist) => context.push('/playlist', arguments: playlist),
        songbook: (songbook) => context.push('/songbook', arguments: songbook),
        songLyric: (songLyric) => context.push('/display', arguments: DisplayScreenArguments.songLyric(songLyric)),
      );
}
