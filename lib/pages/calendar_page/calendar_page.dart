import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../entity/grade_data/grade.dart';
import '../../notifier/calendar/calendar_notifier.dart';
import '../../notifier/grade/grade_notifier.dart';
import '../../util/date_taime_converter.dart';
import '../grade_display_pages/grade_display_page.dart';

class CalendarPage extends HookConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDayValue = useState<DateTime?>(null);
    final focusedDayValue = useState<DateTime>(DateTime.now());
    final selectedEvents = useState<List<Grade>>([]);
    final data = useState<List<Grade>>([]);
    final calendarData = useState<Map<DateTime, List<Grade>>>({});

    useEffect(() {
      // 非同期処理を実行し、結果を状態にセットする
      Future<void> loadData() async {
        final result = await ref.read(gradeListNotifierProvider.notifier).getGradeFromSqLite();
        data.value = result;
      }

      loadData();

      calendarData.value =
          ref.watch(calendarNotifierProvider.notifier).getCalendar(data.value);

      return null;
    }, [ref.watch(calendarNotifierProvider.notifier).getCalendar(data.value)]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('解答実績カレンダー'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2024, 2, 1),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              locale: 'ja_JP',
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month', // 月表示
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: ColorSharedPreferenceService().getColor(),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: ColorSharedPreferenceService().getColor(),
                  shape: BoxShape.circle, // 丸形に設定
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                selectedDayValue.value = selectedDay;
                focusedDayValue.value = focusedDay;
                selectedEvents.value = calendarData
                        .value[convertOnlyDate(selectedDay).toLocal()] ??
                    [];
              },
              selectedDayPredicate: (day) {
                // 同じ日付を選択しているかどうかを判断
                return isSameDay(selectedDayValue.value, day);
              },
              eventLoader: (date) {
                return calendarData.value[convertOnlyDate(date).toLocal()] ??
                    [];
              },
            ),

            ///解答実績がありませんの場合分け

            (selectedEvents.value.isEmpty)
                ? const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      '解答実績はありません。',
                      style: TextStyle(color: Colors.black38),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        itemCount: selectedEvents.value.length,
                        itemBuilder: (context, index) {
                          final event = selectedEvents.value[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20,top: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GradeDisplayPage(isFromGradePage: true, gradeData: event,)),
                                );


                              },
                              child: Container(
                                width: 100,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black38,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            '解答実績:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            event.name,
                                            style: TextStyle(
                                              color:
                                                  ColorSharedPreferenceService()
                                                      .getColor(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            '正答率:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            ((event.correctNumber /
                                                        event.questionNumber) *
                                                    100)
                                                .toString(),
                                            style: TextStyle(
                                              color:
                                                  ColorSharedPreferenceService()
                                                      .getColor(),
                                            ),
                                          ),
                                          const SizedBox(width: 3,),
                                          const Text(
                                            '%',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
