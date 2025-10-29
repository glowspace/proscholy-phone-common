import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectbox/objectbox.dart';
import 'package:proscholy_common/providers/app_dependencies.dart';
import 'package:proscholy_common/utils/extensions/store.dart';

extension RefExtension on Ref {
  void watchEntity<T>(Condition<T> condition, {Function(Query<T>)? onChanged}) {
    final store = read(appDependenciesProvider).store;
    final subscription = store.watchEntity(condition, onChanged ?? (_) => invalidateSelf());

    onDispose(subscription.cancel);
  }
}
