import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:proscholy_common/models/app_dependencies.dart';
import 'package:proscholy_common/models/author.dart';
import 'package:proscholy_common/models/external.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/song.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/models/songbook.dart';
import 'package:proscholy_common/models/songbook_record.dart';
import 'package:proscholy_common/models/tag.dart';
import 'package:proscholy_common/utils/api_client.dart';
import 'package:proscholy_common/views/app_dependencies.dart';

const String _initialDataPath = 'assets/data.json';
const String _initialLastUpdate = '2025-09-24 09:00:00';

const String _currentVersionKey = 'current_version';
const String _lastUpdateKey = 'last_update';

const Duration _updatePeriod = Duration(hours: 1);

final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

Future<void> loadInitial(AppDependencies appDependencies) async {
  final lastVersion = appDependencies.sharedPreferences.getString(_currentVersionKey);

  if (lastVersion == appDependencies.currentVersion) return;

  // during first run of new version load data from assets (makes sure it will be again synced with api :D)

  final json = jsonDecode(await rootBundle.loadString(_initialDataPath));

  await parseAndStoreData(json['data'], appDependencies.store);

  appDependencies.sharedPreferences.remove(_lastUpdateKey);
  appDependencies.sharedPreferences.setString(_currentVersionKey, appDependencies.currentVersion);
}

bool shouldUpdate(AppDependencies appDependencies) {
  final now = DateTime.now();
  final lastUpdate = _dateFormat.parse(
    appDependencies.sharedPreferences.getString(_lastUpdateKey) ?? _initialLastUpdate,
  );

  return !now.isBefore(lastUpdate.add(_updatePeriod));
}

Future<List<SongLyric>> update(AppDependencies appDependencies) async {
  final now = DateTime.now();
  final lastUpdate = _dateFormat.parse(
    appDependencies.sharedPreferences.getString(_lastUpdateKey) ?? _initialLastUpdate,
  );

  if (!now.isBefore(lastUpdate.add(_updatePeriod))) return [];

  // query updated data

  final client = ApiClient();

  final json = await client.getData(lastUpdate);
  final updatedSongLyricIds = await parseAndStoreData(json, appDependencies.store);

  // fix any inconsistencies in song lyrics between local and remote db

  final songLyricsBox = appDependencies.store.box<SongLyric>();
  final query = songLyricsBox.query().build();
  final localSongLyricIds = query.property(SongLyric_.id).find().toSet();

  query.close();

  final remoteSongLyricIds =
      await client.getSongLyricIds().then((data) => data['song_lyrics'].map((json) => int.parse(json['id'])).toSet());

  songLyricsBox.removeMany(localSongLyricIds.difference(remoteSongLyricIds).toList());

  // fetch missing song lyrics

  final futures = <Future<SongLyric>>[];

  for (final id in remoteSongLyricIds.difference(localSongLyricIds)) {
    futures.add(client.getSongLyric(id).then((json) => SongLyric.fromJson(json['song_lyric'])));
  }

  final songLyrics = await Future.wait(futures);
  updatedSongLyricIds.addAll(await songLyricsBox.putManyAsync(songLyrics));

  appDependencies.sharedPreferences.setString(_lastUpdateKey, _dateFormat.format(now));

  // fetch updated song lyrics with populated relations

  final updatedSongLyrics = await songLyricsBox.getManyAsync(updatedSongLyricIds);

  return updatedSongLyrics.cast();
}

@visibleForTesting
Future<List<int>> parseAndStoreData(Map<String, dynamic> jsonMap, Store store) async {
  final authors = [for (final json in jsonMap['authors']) Author.fromJson(json)];
  final externals = [for (final json in jsonMap['externals']) External.fromJson(json)];
  final songs = [for (final json in jsonMap['songs']) Song.fromJson(json)];
  final songbooks = [for (final json in jsonMap['songbooks']) Songbook.fromJson(json)];
  final songLyrics = [for (final json in jsonMap['song_lyrics']) SongLyric.fromJson(json)];
  final tags = [for (final json in jsonMap['tags_enum']) Tag.fromJson(json)];

  void replaceAll<T>(Store store, List<T> items) {
    store.box<T>().removeAll();

    store.box<T>().putMany(items);
  }

  final songLyricIds = await store.runInTransactionAsync(TxMode.write, (Store store, _) {
    // songbook records will be inserted along songbooks
    store.box<SongbookRecord>().removeAll();

    // removes old values to make sure there are no old data that were removed on server
    replaceAll(store, authors);
    replaceAll(store, externals);
    replaceAll(store, songs);
    replaceAll(store, songbooks);
    replaceAll(store, tags);

    return store.box<SongLyric>().putMany(songLyrics);
  }, null);

  await cleanupRelations(store);

  return songLyricIds;
}

@visibleForTesting
Future<void> cleanupRelations(Store store) async {
  void removeWhere<T>(Store store, Condition<T> condition) {
    final box = store.box<T>();
    final query = box.query(condition).build();

    box.removeMany(query.findIds());

    query.close();
  }

  await store.runInTransactionAsync(TxMode.write, (Store store, _) {
    // remove songbook records that were associated with removed song lyrics
    removeWhere(store, SongbookRecord_.songLyric.equals(0));

    // remove playlist records that were associated with removed song lyrics
    removeWhere(
      store,
      PlaylistRecord_.songLyric
          .equals(0)
          .and(PlaylistRecord_.biblePassage.equals(0))
          .and(PlaylistRecord_.userText.equals(0)),
    );
  }, null);
}
