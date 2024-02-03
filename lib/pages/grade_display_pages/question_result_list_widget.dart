

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color.dart';
import '../../constant/style.dart';
import '../../entity/grade_data/grade.dart';
import '../../provider/shared_prefrence_provider.dart';

class QuestionResultListWidget extends HookConsumerWidget {
  const QuestionResultListWidget({
    super.key,
    required this.data
  });

  final Grade data;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors = Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(int i = 0; i<data.gradeDetailList.length; i++) ...{


            SizedBox(height: 15.h,),

            //todo:正解不正解を制御するロジックは今後変更するかも
            (data.gradeDetailList[i].yourAnswer == data.gradeDetailList[i].correct) ?

              const Icon(Icons.circle_outlined,
                size: 45,
                color: Colors.red,
                )

                :

            const Icon(Icons.close,
              size: 45,
              color: Colors.blue,
            ),

            SizedBox(height: 15.h,),

            Text('問題名:',
                style: colorBoldTextStyle(colors)),

            Text(data.gradeDetailList[i].questionName,
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('あなたの回答:',
                style: colorBoldTextStyle(colors)),

            Text(data.gradeDetailList[i].yourAnswer,
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('正解:',
                style: colorBoldTextStyle(colors)),

            Text(data.gradeDetailList[i].correct,
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('解説:',
                style: colorBoldTextStyle(colors)),

            Text(data.gradeDetailList[i].explain,
              style: boldTextStyle,),

            SizedBox(height: 30.h,),

            (i != data.gradeDetailList.length -1) ?//最後の問題以外はDividerを実装
            const Divider()
                :
            const SizedBox(),
          }

        ],
      ),
    );
  }
}