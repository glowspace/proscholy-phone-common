import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proscholy_common/components/open_all_button.dart';
import 'package:proscholy_common/components/section.dart';
import 'package:proscholy_common/components/songbook/songbook_row.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/providers/songbooks.dart';
import 'package:proscholy_common/utils/extensions.dart';

const _maxShowingSongbooks = 3;

class SongbooksSection extends ConsumerWidget {
  const SongbooksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showingSongbooks = ref.watch(songbooksProvider).sublist(0, _maxShowingSongbooks);

    return Section(
      outsideTitle: 'Zpěvníky',
      outsideTitleLarge: true,
      margin: const EdgeInsets.symmetric(vertical: 2 / 3 * kDefaultPadding),
      action: OpenAllButton(
        title: 'Zobrazit vše',
        onTap: () => context.push('/songbooks'),
      ),
      children: [
        ListView.separated(
          primary: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: showingSongbooks.length,
          itemBuilder: (_, index) => SongbookRow(songbook: showingSongbooks[index]),
          separatorBuilder: (_, __) => const Divider(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
