import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constant/format.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/grade_data/grade.dart';
import '../../notifier/calendar/calendar_notifier.dart';
import '../../notifier/grade/grade_notifier.dart';

class CalendarPage extends HookConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDayValue = useState<DateTime?>(null);
    final focusedDayValue = useState<DateTime>(DateTime.now());
    final selectedEvents = useState<List<String>>([]);
    final data = useState<List<Grade>>([]);
    final calendarData = useState<Map<DateTime, List<String>>>({});

    useEffect(() {
      // 非同期処理を実行し、結果を状態にセットする
      Future<void> loadData() async {
        final result = await ref.read(gradeListNotifierProvider);
        data.value = result;
      }

      loadData();

      calendarData.value = ref.watch(calendarNotifierProvider.notifier).getCalendarName(data.value);

      return null;
    }, [ref.watch(calendarNotifierProvider.notifier).getCalendarName(data.value)]);


    print(calendarData.value);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('回答実績カレンダー'),
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
                todayDecoration: const BoxDecoration(
                  color: baseColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: ColorSharedPreferenceService().getColor(), // 背景色を青に設定
                  shape: BoxShape.circle, // 丸形に設定
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                print(selectedDay.toLocal());
                selectedDayValue.value = selectedDay;
                focusedDayValue.value = focusedDay;
                selectedEvents.value = calendarData.value[convertOnlyDate(selectedDay).toLocal()] ?? [];
              },
              selectedDayPredicate: (day) {
                // 同じ日付を選択しているかどうかを判断
                return isSameDay(selectedDayValue.value, day);
              },
              eventLoader: (date) {

                return calendarData.value[convertOnlyDate(date).toLocal()] ?? [];
              },
            ),

            ///回答実績がありませんの場合分け

            (selectedEvents.value.isEmpty)
                ? const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      '回答実績はありません。',
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
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                event,
                                style: TextStyle(
                                  color:
                                      ColorSharedPreferenceService().getColor(),
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
//ColorSharedPreferenceService().getColor(),
