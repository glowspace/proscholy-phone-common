import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:proscholy_common/models/app_dependencies.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook_record.dart';
import 'package:proscholy_common/utils/data.dart';
import 'package:proscholy_common/utils/fts_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockFTSSearch extends Mock implements FTSSearch {}

class MockPackageInfo extends Mock implements PackageInfo {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final AppDependencies appDependencies;
  late final Directory storeDirectory;

  setUpAll(() async {
    storeDirectory = await Directory.systemTemp.createTemp('objectbox_test_');

    appDependencies = AppDependencies(
      ftsSearch: MockFTSSearch(),
      packageInfo: MockPackageInfo(),
      sharedPreferences: MockSharedPreferences(),
      store: await openStore(directory: storeDirectory.path),
    );
  });

  tearDownAll(() async {
    appDependencies.store.close();

    await storeDirectory.delete(recursive: true);
  });

  group('objectbox', () {
    late final store = appDependencies.store;
    late final songLyricsBox = store.box<SongLyric>();

    test('parse and store data', () async {
      await _parseAndStoreData(store);

      final songLyrics = songLyricsBox.getAll();

      expect(songLyrics, hasLength(1));

      final songLyric = songLyrics.first;

      expect(songLyric.authors, hasLength(2));
      expect(songLyric.externals, hasLength(1));
      expect(songLyric.songbookRecords, hasLength(2));
      expect(songLyric.tags, hasLength(2));

      expect(songLyric.songbookRecords.first.songbook.target, isNotNull);
    });

    test('cleanup relations', () async {
      await _parseAndStoreData(store);

      final songLyric = songLyricsBox.get(1)!;

      expect(songLyric.songbookRecords, hasLength(2));

      songLyric.songbookRecords.add(songLyric.songbookRecords.first.copyWith(id: 1));
      songLyricsBox.put(songLyric);

      expect(store.box<SongbookRecord>().getAll(), hasLength(3));

      await _parseAndStoreData(store);

      expect(songLyricsBox.get(1)!.songbookRecords, hasLength(2));

      expect(store.box<SongbookRecord>().getAll(), hasLength(2));
    });
  });
}

Future<void> _parseAndStoreData(Store store) async {
  final json = jsonDecode(await File('test/data/mock_data.json').readAsString());

  await parseAndStoreData(json['data'], store);
}
