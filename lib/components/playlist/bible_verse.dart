import 'package:flutter/material.dart';
import 'package:proscholy_common/components/song_lyric/utils/auto_scroll.dart';
import 'package:proscholy_common/constants.dart';
import 'package:proscholy_common/models/bible_verse.dart';

class BibleVerseWidget extends StatelessWidget {
  final BibleVerse bibleVerse;
  final AutoScrollController autoScrollController;

  const BibleVerseWidget({super.key, required this.bibleVerse, required this.autoScrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: autoScrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2 * kDefaultPadding, vertical: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(bibleVerse.text),
                  const SizedBox(height: 3 * kDefaultPadding),
                  Text(
                    'Chráněno autorskými právy; Oprávnění k distribuci uděleno společnosti CrossWire',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
