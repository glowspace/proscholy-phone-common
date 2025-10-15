import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:proscholy_common/utils/fts_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'generated/app_dependencies.freezed.dart';

@freezed
sealed class AppDependencies with _$AppDependencies {
  const factory AppDependencies({
    // FTS4 database that is used during song lyrics search
    required FTSSearch ftsSearch,
    // info about application (used for version and build number)
    required PackageInfo packageInfo,
    // reference to simple key-value storage
    required SharedPreferences sharedPreferences,
    // objectbox store used as NoSQL database
    required Store store,
  }) = _AppDependencies;
}
