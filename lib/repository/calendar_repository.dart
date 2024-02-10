

import '../constant/format.dart';
import '../entity/grade_data/grade.dart';

// final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
//   return CalendarRepositoryImp();
// });

abstract class CalendarRepository {
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades);

  Map<DateTime, List<String>> getCalendarName(List<Grade> grades);
}

class CalendarRepositoryImp implements CalendarRepository {

  @override
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades) {
    Map<DateTime, List<Grade>> map = {};

    for (Grade grade in grades) {
      DateTime date = convertToDateTime(
          grade.lastDate).toUtc(); // GradeオブジェクトからDateTimeを取得

      // 日付がすでにマップに存在する場合は、そのリストにGradeを追加
      if (map[date] != null) {
        map[date]!.add(grade);
      } else {
        // 存在しない場合は、新しいリストを作成してGradeを追加
        map[date] = [grade];
      }
    }

    return map;
  }

  @override
  Map<DateTime, List<String>> getCalendarName(List<Grade> grades) {
    Map<DateTime, List<String>> map = {};
    for (Grade grade in grades) {
      DateTime date = convertToDateTime(
          grade.lastDate); // GradeオブジェクトからDateTimeを取得

      DateTime modifiedDate = DateTime(date.year, date.month, date.day);

      // 日付がすでにマップに存在する場合は、そのリストにGradeを追加
      if (map[modifiedDate] != null) {
        map[modifiedDate]!.add(grade.name);
      } else {
        // 存在しない場合は、新しいリストを作成してGradeを追加
        map[modifiedDate] = [grade.name];
      }
    }

    return map;
  }
}