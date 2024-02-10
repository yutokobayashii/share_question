

import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('yyyy年MM月dd日');
  return formatter.format(dateTime);
}


DateTime convertToDateTime(String dateStr) {
  final format = DateFormat('yyyy年MM月dd日');
  return format.parse(dateStr);
}

DateTime convertOnlyDate(DateTime time) {
  final year = time.year;
  final month = time.month;
  final day = time.day;
  return DateTime(year,month,day);
}


