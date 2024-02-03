

import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('yyyy年MM月dd日');
  return formatter.format(dateTime);
}
