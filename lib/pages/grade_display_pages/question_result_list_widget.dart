

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color_constant.dart';

class QuestionResultListWidget extends StatelessWidget {
  const QuestionResultListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const listNumber = 3;
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
                style: colorBoldTextStyle),

            Text('あああああああああああああああああああああああああああああああああああああああああ',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('あなたの回答:',
                style: colorBoldTextStyle),

            Text('いいいいいいいいいいいいいいいいいいいいい',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('正解:',
                style: colorBoldTextStyle),

            Text('ううううううううううううう',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('解説:',
                style: colorBoldTextStyle),

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