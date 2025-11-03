import 'dart:async';

import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:proscholy_common/views/recent_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generated/recent_items.g.dart';

const int _maxRecentItems = 5;
const String _recentItemsKey = 'recent_items';

// recent items are only stored in shared preferences as string list in format ['RECENT_ITEM_TYPE;RECENT_ITEM_ID', ...]

@riverpod
class RecentItemsNotifier extends _$RecentItemsNotifier {
  final _subscriptions = <RecentItem, StreamSubscription>{};

  @override
  List<RecentItem> build() {
    final appDependencies = ref.read(appDependenciesProvider);

    return appDependencies.store.runInTransaction(
      TxMode.read,
      () => _loadRecentItems(appDependencies.sharedPreferences, appDependencies.store),
    );
  }

  void add(RecentItem item) {
    if (!_subscriptions.containsKey(item)) _watchForItemChanges(item);

    final items = [
      item,
      for (final recentItem in state)
        if (recentItem != item) recentItem,
    ];

    if (items.length > _maxRecentItems) _subscriptions.remove(items.removeLast())?.cancel();

    ref
        .read(appDependenciesProvider)
        .sharedPreferences
        .setStringList(_recentItemsKey, items.map((item) => item.serialize()).toList());

    state = items;
  }

  List<RecentItem> _loadRecentItems(SharedPreferences sharedPreferences, Store store) {
    final items = <RecentItem>[];

    for (final string in sharedPreferences.getStringList(_recentItemsKey) ?? <String>[]) {
      final item = _RecentItemSerialization.deserialize(string, store);

      if (item != null) {
        _watchForItemChanges(item);

        items.add(item);
      }
    }

    return items;
  }

  // watching for changes of the recent item, e.g. when playlist is renamed
  void _watchForItemChanges(RecentItem item) {
    final store = ref.read(appDependenciesProvider).store;

    final subscription = switch (item) {
      BiblePassage biblePassage => store.watchEntity(BiblePassage_.id.equals(biblePassage.id), _updateItem),
      UserText userText => store.watchEntity(UserText_.id.equals(userText.id), _updateItem),
      Playlist playlist => store.watchEntity(Playlist_.id.equals(playlist.id), _updateItem),
      _ => null,
    };

    if (subscription != null) _subscriptions[item] = subscription;
  }

  void _updateItem(Query<RecentItem> itemQuery) {
    final item = itemQuery.findFirst();

    if (item == null) return;

    state = [
      for (final recentItem in state)
        if (item.runtimeType == recentItem.runtimeType && item.id == recentItem.id) item else recentItem,
    ];
  }
}

extension _RecentItemSerialization on RecentItem {
  static RecentItem? deserialize(String string, Store store) {
    final parts = string.split(';');
    final type = int.parse(parts[0]);
    final id = int.parse(parts[1]);

    return switch (type) {
      0 => store.box<BiblePassage>().get(id),
      1 => store.box<UserText>().get(id),
      2 => store.box<Playlist>().get(id),
      3 => store.box<Songbook>().get(id),
      4 => store.box<SongLyric>().get(id),
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
