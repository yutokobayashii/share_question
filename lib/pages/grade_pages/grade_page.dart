import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/style.dart';
import '../../entity/grade_data/grade.dart';
import '../../usecase/grade_data_usecase.dart';

class GradePage extends StatelessWidget {
  const GradePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradeDataUseCase = GradeDataUseCase();
    final gradeData = gradeDataUseCase.getGradeFromSqLite();

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

class GradeListWidget extends HookConsumerWidget {
  const GradeListWidget({
    super.key,
    required this.i,
    required this.listNumber,
    required this.questionName,
    required this.date,
    required this.rate,
    required this.name,
  });

  final int i;
  final int listNumber;
  final String questionName;
  final String date;
  final String rate;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) =>  const GradeDisplayPage(isFromGradePage: true, gradeData: ,)),
          // );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey, // 外枠の色を黒に
              width: 1, // 外枠の太さ
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Text('問題名:', style: boldTextStyle),
              Text(
                questionName,
                style: boldTextStyle,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Text('作成者:', style: boldTextStyle),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    name,
                    style: boldTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Text('最終解答日:', style: boldTextStyle),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    date,
                    style: boldTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Text('正答率:', style: boldTextStyle),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "$rate%",
                    style: boldTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
