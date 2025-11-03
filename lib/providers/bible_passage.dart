import 'package:proscholy_common/models/model.dart';
import 'package:proscholy_common/utils/extensions/ref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:proscholy_common/models/bible_passage.dart';
import 'package:proscholy_common/models/generated/objectbox.g.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';

part 'generated/bible_passage.g.dart';

@riverpod
BiblePassage? biblePassage(Ref ref, int id) {
  if (id == 0) return null;

  ref.watchEntity(BiblePassage_.id.equals(id));

  return ref.read(appDependenciesProvider).store.box<BiblePassage>().get(id);
}
