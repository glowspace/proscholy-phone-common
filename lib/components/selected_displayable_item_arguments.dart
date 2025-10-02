import 'package:flutter/material.dart';
import 'package:proscholy_common/routing/arguments.dart';

class SelectedDisplayableItemArguments extends InheritedWidget {
  final ValueNotifier<DisplayScreenArguments> contentItemArgumentsNotifier;

  const SelectedDisplayableItemArguments({
    super.key,
    required super.child,
    required this.contentItemArgumentsNotifier,
  });

  @override
  bool updateShouldNotify(SelectedDisplayableItemArguments oldWidget) {
    return contentItemArgumentsNotifier != oldWidget.contentItemArgumentsNotifier;
  }

  static ValueNotifier<DisplayScreenArguments>? of(BuildContext context, {bool listen = true}) {
    final widget = listen
        ? context.dependOnInheritedWidgetOfExactType<SelectedDisplayableItemArguments>()
        : context.getInheritedWidgetOfExactType<SelectedDisplayableItemArguments>();

    return widget?.contentItemArgumentsNotifier;
  }
}
