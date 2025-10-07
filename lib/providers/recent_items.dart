import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/providers/user_text.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/providers/song_lyrics.dart';
import 'package:proscholy_common/providers/songbooks.dart';
import 'package:proscholy_common/views/recent_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/bible_passage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generated/recent_items.g.dart';

const int _maxRecentItems = 5;
const String _recentItemsKey = 'recent_items';

// recent items are only stored in shared preferences as string list in format ['RECENT_ITEM_TYPE;RECENT_ITEM_ID', ...]

@riverpod
class RecentItems extends _$RecentItems {
  @override
  List<RecentItem> build() {
    final appDependencies = ref.read(appDependenciesProvider);

    return appDependencies.store.runInTransaction(
      TxMode.read,
      () => _loadRecentItems(appDependencies.sharedPreferences, appDependencies.store),
    );
  }

  void add(RecentItem item) {
    final items = [
      item,
      for (final recentItem in state)
        if (recentItem != item) recentItem,
    ];

    if (items.length > _maxRecentItems) items.removeLast();

    ref
        .read(appDependenciesProvider)
        .sharedPreferences
        .setStringList(_recentItemsKey, items.map((item) => item.serialize()).toList());

    state = items;
  }

  List<RecentItem> _loadRecentItems(SharedPreferences sharedPreferences, Store store) {
    final items = <RecentItem>[];

    for (final string in sharedPreferences.getStringList(_recentItemsKey) ?? <String>[]) {
      final itemProvider = _RecentItemSerialization.deserialize(string);
      // watching for changes of the recent item, e.g. when playlist is renamed
      final item = ref.watch(itemProvider);

      if (item != null) items.add(item);
    }

    return items;
  }
}

extension _RecentItemSerialization on RecentItem {
  static ProviderListenable<RecentItem?> deserialize(String string) {
    final parts = string.split(';');
    final type = int.parse(parts[0]);
    final id = int.parse(parts[1]);

    return switch (type) {
      0 => biblePassageProvider(id),
      1 => userTextProvider(id),
      2 => playlistProvider(id),
      3 => songbookProvider(id),
      4 => songLyricProvider(id),
      final value => throw UnimplementedError('$value is not valid recent item type'),
    };
  }

  String serialize() {
    final type = map(
      biblePassage: (_) => 0,
      userText: (_) => 1,
      playlist: (_) => 2,
      songbook: (_) => 3,
      songLyric: (_) => 4,
    );

    return '$type;$id';
  }
}
