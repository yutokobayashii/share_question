import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/usecase/calendar/calendar_usecase.dart';

import '../../entity/grade_data/grade.dart';

final calendarNotifierProvider =
    NotifierProvider<CalendarNotifier, void>(CalendarNotifier.new);

class CalendarNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Map<DateTime, List<Grade>> getCalendar(List<Grade> grades) {
    final repository = CalendarUseCaseImp();
    return repository.getCalendar(grades);
  }
}
