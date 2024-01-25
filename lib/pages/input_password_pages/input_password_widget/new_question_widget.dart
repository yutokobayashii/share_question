

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/style.dart';
import '../../../entity/question_data/question.dart';

class NewQuestionWidget extends StatelessWidget {
  const NewQuestionWidget({
    super.key,
    required this.questionData,
  });

  final Question questionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -50.w,
      //  height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),

            Text('問題集名:${questionData.name}',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('作成者:${questionData.author}',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('問題数:${questionData.questionDetailList.length}問',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('説明:',
                  style: boldTextStyle,),
                Text(questionData.explain,
                  style: normalTextStyle,),
              ],
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }
}