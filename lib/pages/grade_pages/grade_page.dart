import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/style.dart';
import '../grade_display_pages/grade_display_page.dart';

class GradePage extends StatelessWidget {
  const GradePage({super.key});

  @override
  Widget build(BuildContext context) {
    const listNumber = 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("成績"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.lightbulb_outline,size: 28,),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),

              for(int i = 0; i<listNumber; i++) ...{
          
                GradeListWidget(
                  i: i,
                  listNumber: listNumber,
                  questionName: 'っっっっっっっっっっっっっk',
                  date: '2023/12/31',
                  rate: '80',
                  name: '小林優斗',
          
                ),
                const SizedBox(height: 30,),
              }
            ],
          ),
        ),
      )
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
  Widget build(BuildContext context,WidgetRef ref) {
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

              SizedBox(height: 15.h,),

              Text('問題名:',
                  style: boldTextStyle),

              Text(questionName,
                style: boldTextStyle,),

              SizedBox(height: 15.h,),

              Row(
                children: [
                  Text('作成者:',
                      style: boldTextStyle),

                  SizedBox(width: 5.w,),

                  Text(name,
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),



              Row(
                children: [
                  Text('最終解答日:',
                      style: boldTextStyle),

                  SizedBox(width: 5.w,),

                  Text(date,
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),

              Row(
                children: [
                  Text('正答率:',
                      style: boldTextStyle),

                  SizedBox(width: 5.w,),

                  Text("$rate%",
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),

            ],
          ),
        ),
      ),
    );
  }
}