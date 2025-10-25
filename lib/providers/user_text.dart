import 'package:proscholy_common/utils/extensions/ref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/user_text.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';

part 'generated/user_text.g.dart';

@riverpod
UserText? userText(Ref ref, int id) {
  if (id == 0) return null;

  ref.watchEntity(UserText_.id.equals(id));

  return ref.read(appDependenciesProvider).store.box<UserText>().get(id);
}
