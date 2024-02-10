import 'package:freezed_annotation/freezed_annotation.dart';

import '../grade_data/grade.dart';

part 'calendar_data.freezed.dart';

part 'calendar_data.g.dart';

@freezed
class CalendarData with _$CalendarData {
  const factory CalendarData({
    required DateTime time,
    required Grade grade,
  }) = _CalendarData;

  factory CalendarData.fromJson(Map<String, dynamic> json) =>
      _$CalendarDataFromJson(json);
}
