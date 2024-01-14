
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/style.dart';
import '../../../entity/question_data/question.dart';
import 'optional_widget.dart';

class PastQuestionDetailListWidget extends StatelessWidget {
  const PastQuestionDetailListWidget({
    super.key,
    required this.questionList,
    required this.i,

  });


  final List<QuestionDetail> questionList;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h,),

            Text('${i+1}問目',style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('問題:',style: boldTextStyle,),
            SizedBox(height: 10.h,),
            Text(questionList[i].questionName,style: normalTextStyle,),

            SizedBox(height: 15.h,),

            (questionList[i].image != "") ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('画像:',style: boldTextStyle,),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200.h,
                      child: Image.network(questionList[i].image),
                    ),
                  ],
                )
                :
                const SizedBox(),


            SizedBox(height: 15.h,),

            questionList[i].isOptional ?
             OptionalWidget(optionalList: questionList[i].optionalList,)
                :
            const SizedBox(),

            Text('解答:',style: boldTextStyle,),
            SizedBox(height: 10.h,),
            Text(questionList[i].correctAnswer,style: normalTextStyle,),

            SizedBox(height: 15.h,),

            Text('解説:',style: boldTextStyle,),
            SizedBox(height: 10.h,),
            Text(questionList[i].explanation,style: normalTextStyle,),





            SizedBox(height: 20.h,),

          ],),
      ),
    );
  }
}

