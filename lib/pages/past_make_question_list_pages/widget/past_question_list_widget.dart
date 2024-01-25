
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/pages/past_question_detail_page/past_question_detail_page.dart';

import '../../../collection/token/token.dart';
import '../../../constant/color.dart';
import '../../../constant/style.dart';
import '../../../provider/shared_prefrence_provider.dart';

class PastQuestionListWidget extends HookConsumerWidget {
  const PastQuestionListWidget({
    super.key,
    required this.list,
    required this.i,
  });

  final List<Token> list;
  final int i;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors = Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PastQuestionDetailPage(list[i].token)),
        );

      },
      child: Container(
        width: MediaQuery.of(context).size.width - 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
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

              SizedBox(height: 15.h,),

              Text('問題名:',
                  style: colorBoldTextStyle(colors)),

              Text(list[i].questionName,
                style: boldTextStyle,),

              SizedBox(height: 15.h,),

              Row(
                children: [
                  Text('作成者:',
                      style: colorBoldTextStyle(colors)),

                  SizedBox(width: 5.w,),

                  Text(list[i].author,
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),



              Row(
                children: [
                  Text('作成日:',
                      style: colorBoldTextStyle(colors)),

                  SizedBox(width: 5.w,),

                  Text(list[i].createdAt,
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('説明:',
                      style: colorBoldTextStyle(colors)),

                  SizedBox(width: 5.w,),

                  Text(list[i].explain,
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