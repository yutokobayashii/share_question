




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color.dart';
import '../../constant/style.dart';
import '../../entity/question_data/question.dart';
import '../../provider/shared_prefrence_provider.dart';
import '../../widgets/copy_text_icon.dart';
import '../past_make_question_list_pages/widget/past_question_detail_list_widget.dart';

class PastQuestionDetailWidget extends HookConsumerWidget {
  const PastQuestionDetailWidget(this.question, this.token, {
    super.key,
  });
  final Question question;
  final String token;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 50.h,),

        Text('この問題のパスワード',
          style: boldTextStyle,),

        SizedBox(height: 15.h,),

        Container(
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: IntrinsicWidth(
            child: Row(
              children: [
                 CopyTextIcon(textToCopy: token),

                Text(token, style: normalTextStyle,),
              ],
            ),
          ),
        ),

        SizedBox(height: 15.h,),

        Text('追加された回数:5回',
          style: boldTextStyle,),

        SizedBox(height: 15.h,),

        Text('解答された回数:5回',
          style: boldTextStyle,),

        SizedBox(height: 15.h,),

        Row(
          children: [
            Icon(Icons.star,color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),),
            SizedBox(width: 5.w,),
            Text('いいね数:5',
              style: boldTextStyle,),
          ],
        ),

        SizedBox(height: 50.h,),

        Text('問題集名',
          style: boldTextStyle,),

        SizedBox(height: 5.h,),

        Text(question.name,
          style: normalTextStyle,),

        SizedBox(height: 25.h,),

        Text('作成者名',
          style: boldTextStyle,),

        SizedBox(height: 5.h,),

        Text(question.author,
          style: normalTextStyle,),


        SizedBox(height: 25.h,),

        Row(
          children: [
            Text('作成日:',
              style: boldTextStyle,),

            SizedBox(width: 5.w,),

            Text("${question.createdAt.year}/${question.createdAt.month}/${question.createdAt.day}",
              style: boldTextStyle,),

          ],
        ),



        SizedBox(height: 25.h,),

        Text('問題集の説明',
          style: boldTextStyle,),

        SizedBox(height: 5.h,),

        Text(question.explain,
          style: normalTextStyle,),

        SizedBox(height: 25.h,),

        Text('解答した人へのコメント',
          style: boldTextStyle,),

        SizedBox(height: 5.h,),

        Text(question.comment,
          style: normalTextStyle,),

        SizedBox(height: 50.h,),


        for(int i = 0; i<question.questionDetailList.length; i++) ...{
           PastQuestionDetailListWidget(
             questionList: question.questionDetailList,
             i: i,),
          const SizedBox(height: 20,),
        },


        const SizedBox(height: 100,)
      ],
    );
  }
}