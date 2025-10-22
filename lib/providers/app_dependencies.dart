import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart';
import 'package:proscholy_common/models/app_dependencies.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/models/song_lyric.dart';
import 'package:proscholy_common/utils/fts_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

const String _ftsDatabaseName = 'zpevnik.db';

// will be overriden in `main.dart` with real value using `overrideAppDependenciesProvider` function
final appDependenciesProvider = Provider<AppDependencies>((_) => throw UnimplementedError());

Future<(AppDependencies, Override)> overrideAppDependenciesProvider() async {
  final store = await openStore();
  final database = await openDatabase(join(await getDatabasesPath(), _ftsDatabaseName));

  final appDependencies = AppDependencies(
    ftsSearch: FTSSearch(database: database, songLyricsBox: store.box<SongLyric>()),
    packageInfo: await PackageInfo.fromPlatform(),
    sharedPreferences: await SharedPreferences.getInstance(),
    store: store,
  );

  return (appDependencies, appDependenciesProvider.overrideWithValue(appDependencies));
}
