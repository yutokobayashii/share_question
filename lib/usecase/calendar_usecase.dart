import '../entity/grade_data/grade.dart';
import '../repository/calendar_repository.dart';

abstract class CalendarUseCase {
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades);
  Map<DateTime, List<String>> getCalendarName(List<Grade> grades);
}

class CalendarUseCaseImp implements CalendarUseCase {
  final _repository = CalendarRepositoryImp();

  @override
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades) {
    return _repository.getCalendar(grades);
  }

  @override
  Map<DateTime, List<String>> getCalendarName(List<Grade> grades) {
    return _repository.getCalendarName(grades);
  }
}
