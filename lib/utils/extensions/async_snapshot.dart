import 'package:flutter/widgets.dart';

extension AsyncSnapshotExtension on AsyncSnapshot {
  bool get isLoading => connectionState == ConnectionState.waiting;
  bool get isDone => connectionState == ConnectionState.done;
}
