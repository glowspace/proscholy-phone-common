import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscholy_common/components/open_all_button.dart';
import 'package:proscholy_common/components/playlist/playlist_row.dart';
import 'package:proscholy_common/components/section.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/utils/extensions.dart';

const _maxShowingPlaylists = 3;

class SongListsSection extends ConsumerWidget {
  const SongListsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlists = [ref.read(favoritePlaylistProvider)] + ref.watch(playlistsProvider);

    return Section(
      outsideTitle: 'Moje seznamy',
      outsideTitleLarge: true,
      margin: const EdgeInsets.symmetric(vertical: 2 / 3 * kDefaultPadding),
      action: OpenAllButton(
        title: 'Zobrazit vše',
        onTap: () => context.push('/playlists'),
      ),
      children: [
        ListView.separated(
          itemCount: min(_maxShowingPlaylists, playlists.length),
          itemBuilder: (_, index) => PlaylistRow(playlist: playlists[index]),
          separatorBuilder: (_, __) => const Divider(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
