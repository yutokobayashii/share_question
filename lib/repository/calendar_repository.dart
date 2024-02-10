import '../entity/grade_data/grade.dart';
import '../util/date_taime_converter.dart';

// final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
//   return CalendarRepositoryImp();
// });

abstract class CalendarRepository {
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades);
}

class CalendarRepositoryImp implements CalendarRepository {
  @override
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades) {
    Map<DateTime, List<Grade>> map = {};

    for (Grade grade in grades) {
      DateTime date =
          convertToDateTime(grade.lastDate); // GradeオブジェクトからDateTimeを取得

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
}
