import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/grade_data/grade.dart';
import '../../notifier/grade/grade_notifier.dart';
import 'grade_list_widget.dart';

class GradePage extends ConsumerWidget{
  const GradePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final gradeData = ref.watch(gradeListNotifierProvider);

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
      body: FutureBuilder<List<Grade>>(
          future: gradeData,
          builder: (BuildContext context, AsyncSnapshot<List<Grade>> snapshot) {
            if (snapshot.hasError) {
              return const Text("エラーが発生しました。");
            } else if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            } else if (snapshot.data?.isEmpty ?? true) {
              return Container(
                color: Colors.white,
                child: const Center(
                    child: Text(
                  "解答実績がありません。\nパスワードを照合して問題を解答しましょう",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black38),
                )),
              );
            } else {
              return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      for (int i = 0; i < snapshot.data!.length; i++) ...{
                        GradeListWidget(
                          i: i,
                          listNumber: snapshot.data!.length,
                          questionName: snapshot.data![i].name,
                          date: snapshot.data![i].lastDate,
                          rate: ((snapshot.data![i].correctNumber /
                                      snapshot.data![i].questionNumber) *
                                  100)
                              .toString(),
                          name: snapshot.data![i].author,
                          grade: snapshot.data![i],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      }
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}

