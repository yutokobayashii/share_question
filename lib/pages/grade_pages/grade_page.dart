import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/grade_data/grade.dart';
import '../../notifier/grade/grade_notifier.dart';
import 'grade_list_widget.dart';

class GradePage extends HookConsumerWidget {
  const GradePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncData = useState<List<Grade>?>(null);

    final gradeListState = ref.watch(gradeListNotifierProvider.notifier).getGradeFromSqLite();

    useEffect(() {
      void fetchData() async {
        final data = await ref
            .read(gradeListNotifierProvider.notifier)
            .getGradeFromSqLite();
        asyncData.value = data;
      }

      fetchData();

      return null;
    }, [gradeListState]);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("成績"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.lightbulb_outline,
                size: 28,
              ),
            )
          ],
        ),
        body: (asyncData.value?.isEmpty ?? true)
            ? Container(
                color: Colors.white,
                child: const Center(
                    child: Text(
                  "解答実績がありません。\nパスワードを照合して問題を解答しましょう",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black38),
                )),
              )
            : Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      for (int i = 0; i < asyncData.value!.length; i++) ...{
                        GradeListWidget(
                          i: i,
                          listNumber: asyncData.value!.length,
                          questionName: asyncData.value![i].name,
                          date: asyncData.value![i].lastDate,
                          rate: ((asyncData.value![i].correctNumber /
                                      asyncData.value![i].questionNumber) *
                                  100)
                              .toString(),
                          name: asyncData.value![i].author,
                          grade: asyncData.value![i],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      },
                      const SizedBox(
                        height: 400,
                      )
                    ],
                  ),
                ),
              ));
  }
}
