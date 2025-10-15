import 'package:proscholy_common/models/app_dependencies.dart';

extension AppDependenciesView on AppDependencies {
  String get currentVersion => '${packageInfo.version}+${packageInfo.buildNumber}';
}
