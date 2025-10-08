import 'package:proscholy_common/models/bible_passage.dart';

extension BiblePassageView on BiblePassage {
  String get name => endVerse == null
      ? '${supportedBibleBooks[book].name} $chapter:$startVerse'
      : '${supportedBibleBooks[book].name} $chapter:$startVerse-$endVerse';
}
