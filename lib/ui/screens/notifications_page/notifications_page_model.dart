import 'package:flutter/material.dart';
class NotificationsWidgetModel extends ChangeNotifier{
  final List<DateDetailed> date;
  final DateTime dateTime;
  NotificationsWidgetModel({
    required this.date,
    required this.dateTime
});
}


class DateDetailed {
  final String name;
  final String icon;
  final String secondTitle;
  DateDetailed({
    required this.name,
    required this.icon,
    required this.secondTitle,
});
}



class NotificationsWidgetProvider extends InheritedNotifier {
  NotificationsWidgetProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);
  static NotificationsWidgetProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotificationsWidgetProvider>();
  }

  static NotificationsWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotificationsWidgetProvider>()
        ?.widget;
    return widget is NotificationsWidgetProvider ? widget : null;
  }
}
