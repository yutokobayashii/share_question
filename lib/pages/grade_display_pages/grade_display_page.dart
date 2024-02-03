

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';
import 'package:share_question/pages/grade_display_pages/question_result_list_widget.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../../constant/style.dart';
import '../../entity/grade_data/grade.dart';
import '../../provider/shared_prefrence_provider.dart';


class GradeDisplayPage extends HookConsumerWidget {
  const GradeDisplayPage({
    super.key,
    required this.isFromGradePage,
    required this.gradeData
  });

  final bool isFromGradePage;
  final Grade gradeData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final int score = gradeData.correctNumber;
    final int total = gradeData.questionNumber;
    print(score);
    print(total);
    double percentage = score / total;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Text(gradeData.name),
          centerTitle:true,
          leading: (isFromGradePage) ?
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 28,))
              : Opacity(opacity: 0, child: Container()),


        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),

                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: PieChart(
                            PieChartData(
                              startDegreeOffset: -90,
                              sections: [
                                PieChartSectionData(
                                  color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                                  value: percentage * 100,
                                  title: '',
                                  radius: 20,
                                ),
                                PieChartSectionData(
                                  color: Colors.black12,
                                  value: (1 - percentage) * 100,
                                  title: '',
                                  radius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '${(percentage * 100).toStringAsFixed(1)}%', // テキストでパーセンテージを表示
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                   SizedBox(height: 30.h,),

                   Align(
                     alignment: Alignment.centerLeft,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('作成者からのコメント',
                          style: boldTextStyle,),
                        SizedBox(height: 10.h,),
                        Text(gradeData.comment,
                          style: normalTextStyle,
                        )
                      ],
                                       ),
                   ),

                  SizedBox(height: 25.h,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '解答結果',
                      style: boldTextStyle,),
                  ),

                  SizedBox(height: 15.h,),

                   QuestionResultListWidget(data: gradeData,),

                  SizedBox(height: 100.h,),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: (isFromGradePage) ?
            const SizedBox()
            : BasicFloatingButtonWidget(
          text: '戻る',
          action: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },

        ),
      ),
    );
  }
}


