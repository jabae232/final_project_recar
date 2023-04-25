import 'package:flutter/material.dart';
class NewsWidgetModel extends ChangeNotifier{

}

class  NewsWidgetProvider extends InheritedNotifier {
  NewsWidgetModel model;
  NewsWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key,notifier: model, child: child);
  static NewsWidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NewsWidgetProvider>();
  }

  static NewsWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NewsWidgetProvider>()
        ?.widget;
    return widget is NewsWidgetProvider ? widget : null;
  }
}
