import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:proscholy_common/models/app_dependencies.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/playlist.dart';
import 'package:proscholy_common/models/playlist_record.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook_record.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/providers/playlists.dart';
import 'package:proscholy_common/utils/data.dart';
import 'package:proscholy_common/utils/fts_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockFTSSearch extends Mock implements FTSSearch {}

class MockPackageInfo extends Mock implements PackageInfo {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final ProviderContainer providerContainer;
  late final Directory storeDirectory;

  setUpAll(() async {
    storeDirectory = await Directory.systemTemp.createTemp('objectbox_test_');

    providerContainer = ProviderContainer(
      overrides: [
        appDependenciesProvider.overrideWithValue(
          AppDependencies(
            ftsSearch: MockFTSSearch(),
            packageInfo: MockPackageInfo(),
            sharedPreferences: MockSharedPreferences(),
            store: await openStore(directory: storeDirectory.path),
          ),
        ),
      ],
    );
  });

  tearDownAll(() async {
    providerContainer.read(appDependenciesProvider).store.close();

    await storeDirectory.delete(recursive: true);
  });

  group('objectbox', () {
    late final store = providerContainer.read(appDependenciesProvider).store;

    test('parse and store data', () async {
      await _parseAndStoreData(store);

      final songLyrics = store.box<SongLyric>().getAll();

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

      final songLyric = store.box<SongLyric>().get(1)!;

      expect(songLyric.songbookRecords, hasLength(2));

      songLyric.songbookRecords.add(songLyric.songbookRecords.first.copyWith(id: 1));
      store.box<SongLyric>().put(songLyric);

      expect(store.box<SongbookRecord>().getAll(), hasLength(3));

      await _parseAndStoreData(store);

      expect(store.box<SongLyric>().get(1)!.songbookRecords, hasLength(2));

      expect(store.box<SongbookRecord>().getAll(), hasLength(2));
    });
  });

  group('playlists', () {
    late final store = providerContainer.read(appDependenciesProvider).store;

    setUp(() {
      store.box<Playlist>().removeAll();
      store.box<PlaylistRecord>().removeAll();
      store.box<BiblePassage>().removeAll();
      store.box<UserText>().removeAll();
    });

    test('create and remove', () async {
      await _parseAndStoreData(store);

      final PlaylistNotifier playlistNotifier;
      {
        final playlist = providerContainer.read(playlistsProvider.notifier).addPlaylist(Playlist.empty('Test'));
        playlistNotifier = providerContainer.read(playlistProvider(playlist).notifier);
      }

      playlistNotifier.addBiblePassage(
        BiblePassage(
          book: 19,
          chapter: 12,
          startVerse: 1,
          text: 'Kdo miluje napomenutí, miluje poznání, kdežto kdo domluvy nenávidí, je tupec.',
        ),
      );
      playlistNotifier.addSongLyric(store.box<SongLyric>().get(1)!);
      playlistNotifier.addUserText(UserText(name: 'Test', content: 'Test'));

      final playlist = store.box<Playlist>().get(playlistNotifier.playlist.id);

      expect(playlist, isNotNull);
      expect(playlist!.records, hasLength(3));
      expect(playlist.records[0].biblePassage.target, isNotNull);
      expect(playlist.records[1].songLyric.target, isNotNull);
      expect(playlist.records[2].userText.target, isNotNull);

      playlistNotifier.remove();

      expect(store.box<Playlist>().get(playlistNotifier.playlist.id), isNull);
      expect(store.box<PlaylistRecord>().getAll(), isEmpty);
      expect(store.box<BiblePassage>().getAll(), isEmpty);
      expect(store.box<UserText>().getAll(), isEmpty);
    });

    test('duplicate', () async {
      await _parseAndStoreData(store);

      final PlaylistNotifier playlistNotifier;
      {
        final playlist = providerContainer.read(playlistsProvider.notifier).addPlaylist(Playlist.empty('Test'));
        playlistNotifier = providerContainer.read(playlistProvider(playlist).notifier);
      }

      playlistNotifier.addBiblePassage(
        BiblePassage(
          book: 19,
          chapter: 12,
          startVerse: 1,
          text: 'Kdo miluje napomenutí, miluje poznání, kdežto kdo domluvy nenávidí, je tupec.',
        ),
      );
      playlistNotifier.addSongLyric(store.box<SongLyric>().get(1)!);
      playlistNotifier.addUserText(UserText(name: 'Test', content: 'Test'));

      final duplicatedPlaylist = playlistNotifier.duplicate('Duplicate');

      {
        final playlist = store.box<Playlist>().get(duplicatedPlaylist.id);

        expect(playlist, isNotNull);
        expect(playlist!.records, hasLength(3));
        expect(playlist.records[0].biblePassage.target, isNotNull);
        expect(playlist.records[1].songLyric.target, isNotNull);
        expect(playlist.records[2].userText.target, isNotNull);
      }

      playlistNotifier.remove();

      final playlist = store.box<Playlist>().get(duplicatedPlaylist.id);

      expect(playlist, isNotNull);
      expect(playlist!.records, hasLength(3));
      expect(playlist.records[0].biblePassage.target, isNotNull);
      expect(playlist.records[1].songLyric.target, isNotNull);
      expect(playlist.records[2].userText.target, isNotNull);
    });
  });
}

Future<void> _parseAndStoreData(Store store) async {
  final json = jsonDecode(await File('test/data/mock_data.json').readAsString());

  await parseAndStoreData(json['data'], store);
}
