import 'package:proscholy_common/models/songbook.dart';

// prioritized songbook shortcuts in sorting
const _prioritizedSongbooks = {'H1': 0, 'H2': 1, 'K': 2, 'Kan': 3};

int compareSongbooks(Songbook a, Songbook b, [List<int> pinnedSongbookIds = const []]) {
  final pinnedIndexA = pinnedSongbookIds.indexOf(a.id);
  final pinnedIndexB = pinnedSongbookIds.indexOf(b.id);

  if (pinnedIndexA != -1 && pinnedIndexB != -1) {
    return pinnedIndexA.compareTo(pinnedIndexB);
  } else if (pinnedIndexA != -1) {
    return -1;
  } else if (pinnedIndexB != -1) {
    return 1;
  }

  final prioritizedIndexA = _prioritizedSongbooks[a.shortcut];
  final prioritizedIndexB = _prioritizedSongbooks[b.shortcut];

  if (prioritizedIndexA != null && prioritizedIndexB != null) {
    return prioritizedIndexA.compareTo(prioritizedIndexB);
  } else if (prioritizedIndexA != null) {
    return -1;
  } else if (prioritizedIndexB != null) {
    return 1;
  }

  return a.name.compareTo(b.name);
}
