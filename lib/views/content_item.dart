import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/custom_text.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/views/bible_passage.dart';

extension ContentItemView on ContentItem {
  String get name => map(
        biblePassage: (biblePassage) => biblePassage.name,
        customText: (customText) => customText.name,
        songLyric: (songLyric) => songLyric.name,
      );

  String get title => map(
        biblePassage: (biblePassage) => biblePassage.name,
        customText: (customText) => customText.name,
        songLyric: (songLyric) => '${songLyric.id}',
      );

  T map<T>({
    required T Function(BiblePassage) biblePassage,
    required T Function(CustomText) customText,
    required T Function(SongLyric) songLyric,
  }) =>
      switch (this) {
        BiblePassage value => biblePassage(value),
        CustomText value => customText(value),
        SongLyric value => songLyric(value),
        _ => throw UnimplementedError('$this is not supported `ContentItem`'),
      };
}
