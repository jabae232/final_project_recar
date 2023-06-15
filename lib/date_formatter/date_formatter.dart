import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateFormatter {
  String getProperDate(DateTime dateTime, context) {
    late DateFormat formatter;
    if (DateTime.now().year > dateTime.year) {
      formatter = DateFormat('yMMMd');
    } else if (DateTime.now().month != dateTime.month) {
      formatter = DateFormat('MMMd');
    } else if (DateTime.now().month == dateTime.month) {
      if (DateTime.now().day == dateTime.day) {
        if (DateTime.now().hour == dateTime.hour) {
          if (DateTime.now().minute == dateTime.minute) {
            return "just now";
          }
          return DateTime.now().minute - dateTime.minute == 1
              ? "1 ${AppLocalizations.of(context)?.minuteAgo}"
              : "${(DateTime.now().minute - dateTime.minute).toString()} ${AppLocalizations.of(context)?.minutesAgo}";
        } else {
          return DateFormat('HH:mm').format(dateTime);
        }
      } else {
        if (DateTime.now().day - dateTime.day > 7) {
          formatter = DateFormat('MMMd');
        } else if (DateTime.now().day - dateTime.day == 1) {
          return "${AppLocalizations.of(context)?.dayAgo}";
        } else {
          return "${DateTime.now().day - dateTime.day} ${AppLocalizations.of(context)?.daysAgo}";
        }
      }
    } else {
      formatter = DateFormat('yMMMd');
    }
    final formatedDate = formatter.format(dateTime);
    return formatedDate.toString();
  }
}
