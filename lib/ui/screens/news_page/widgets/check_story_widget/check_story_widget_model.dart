import 'package:flutter/material.dart';
class CheckStoryWidgetModel extends ChangeNotifier{

}


class  CheckStoryWidgetModelProvider extends InheritedNotifier {
  CheckStoryWidgetModel model;
  CheckStoryWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key,notifier: model, child: child);
  static CheckStoryWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CheckStoryWidgetModelProvider>();
  }

  static CheckStoryWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CheckStoryWidgetModelProvider>()
        ?.widget;
    return widget is CheckStoryWidgetModelProvider ? widget : null;
  }
}
