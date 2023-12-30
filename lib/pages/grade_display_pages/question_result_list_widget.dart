

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color_constant.dart';
import '../../provider/shared_prefrence_provider.dart';

class QuestionResultListWidget extends HookConsumerWidget {
  const QuestionResultListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    const listNumber = 3;
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
          for(int i = 0; i<listNumber; i++) ...{


            SizedBox(height: 15.h,),

            const Icon(Icons.close,
              size: 45,
              color: Colors.blue,
            ),

            SizedBox(height: 15.h,),

            Text('問題名:',
                style: colorBoldTextStyle(colors)),

            Text('あああああああああああああああああああああああああああああああああああああああああ',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('あなたの回答:',
                style: colorBoldTextStyle(colors)),

            Text('いいいいいいいいいいいいいいいいいいいいい',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('正解:',
                style: colorBoldTextStyle(colors)),

            Text('ううううううううううううう',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('解説:',
                style: colorBoldTextStyle(colors)),

            Text('えええええええええええええええええええええええええええええええええええええええええええええ',
              style: boldTextStyle,),

            SizedBox(height: 30.h,),

            (i != listNumber -1) ?
            const Divider()
                :
            const SizedBox(),
          }

        ],
      ),
    );
  }
}