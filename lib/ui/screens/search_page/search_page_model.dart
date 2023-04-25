import 'package:flutter/material.dart';
class SearchWidgetModel extends ChangeNotifier{

}

class  SearchWidgetProvider extends InheritedNotifier {
  SearchWidgetModel model;
  SearchWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key,notifier: model, child: child);
  static SearchWidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SearchWidgetProvider>();
  }

  static SearchWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SearchWidgetProvider>()
        ?.widget;
    return widget is SearchWidgetProvider ? widget : null;
  }
}
