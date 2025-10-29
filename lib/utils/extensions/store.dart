import 'dart:async';

import 'package:proscholy_common/models/generated/objectbox.g.dart';

extension BoxExtension<T> on Box<T> {
  int nextId(QueryProperty<T, int> idProperty) {
    final query = this.query().build();
    final lastId = query.property(idProperty).max();

    query.close();

    return lastId + 1;
  }
}

extension StoreExtension on Store {
  List<T> query<T, D>({
    Condition<T>? condition,
    QueryProperty<T, D>? orderBy,
    // default ascending
    int orderFlags = 0,
  }) {
    final query = _queryBuilder(condition, orderBy, orderFlags).build();
    final data = query.find();

    query.close();

    return data;
  }

  Stream<List<T>> watchQuery<T, D>({
    Condition<T>? condition,
    QueryProperty<T, D>? orderBy,
    // default ascending
    int orderFlags = 0,
  }) {
    return _queryBuilder(condition, orderBy, orderFlags).watch(triggerImmediately: true).map((query) => query.find());
  }

  StreamSubscription<Query<T>> watchEntity<T>(Condition<T> condition, void Function(Query<T>) onData) {
    final stream = _queryBuilder(condition, null, 0).watch();

    return stream.listen(onData);
  }


  QueryBuilder<T> _queryBuilder<T, D>(Condition<T>? condition, QueryProperty<T, D>? orderBy, int orderFlags) {
    final box = this.box<T>();
    final queryBuilder = box.query(condition);

    if (orderBy != null) queryBuilder.order(orderBy, flags: orderFlags);

    return queryBuilder;
  }
}

