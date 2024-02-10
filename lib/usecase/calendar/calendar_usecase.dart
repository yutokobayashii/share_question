import '../../entity/grade_data/grade.dart';
import '../../repository/calendar/calendar_repository.dart';

abstract class CalendarUseCase {
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades);
}

class CalendarUseCaseImp implements CalendarUseCase {
  final _repository = CalendarRepositoryImp();

  @override
  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades) {
    return _repository.getCalendar(grades);
  }
}
