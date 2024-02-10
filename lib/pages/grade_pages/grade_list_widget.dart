

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/style.dart';
import '../../entity/grade_data/grade.dart';
import '../grade_display_pages/grade_display_page.dart';

class GradeListWidget extends HookConsumerWidget {
  const GradeListWidget({
    super.key,
    required this.i,
    required this.listNumber,
    required this.questionName,
    required this.date,
    required this.rate,
    required this.name,
    required this.grade
  });

  final int i;
  final int listNumber;
  final String questionName;
  final String date;
  final String rate;
  final String name;
  final Grade grade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GradeDisplayPage(isFromGradePage: true, gradeData: grade,)),
          );
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

              const Center(child: Text('詳細を見る',style: TextStyle(color: Colors.black38),)),

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
