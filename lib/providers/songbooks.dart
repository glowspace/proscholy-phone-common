import 'package:proscholy_common/providers/comparators/songbook.dart';
import 'package:proscholy_common/utils/extensions/store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/songbook.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';

part 'generated/songbooks.g.dart';

const _pinnedSongbookIdsKey = 'pinned_songbook_ids';

@riverpod
class PinnedSongbookIdsNotifier extends _$PinnedSongbookIdsNotifier {
  SharedPreferences get _sharedPreferences {
    return ref.read(appDependenciesProvider).sharedPreferences;
  }

  @override
  List<int> build() {
    return _sharedPreferences.getStringList(_pinnedSongbookIdsKey)?.map(int.parse).toList() ?? [];
  }

  void togglePin(Songbook songbook) {
    final pinnedSongbookIds = [
      if (!state.contains(songbook.id)) songbook.id,
      ...[
        for (final id in state)
          if (id != songbook.id) id
      ]
    ];

    _sharedPreferences.setStringList(_pinnedSongbookIdsKey, [for (final id in pinnedSongbookIds) '$id']);

    state = pinnedSongbookIds;
  }
}

@riverpod
List<Songbook> songbooks(Ref ref) {
  final songbooks = ref.watch(appDependenciesProvider).store.query(condition: Songbook_.isPrivate.equals(false));
  final pinnedSongbookIds = ref.watch(pinnedSongbookIdsProvider);

  songbooks.sort((a, b) => compareSongbooks(a, b, pinnedSongbookIds));

  return songbooks;
}
