
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/style.dart';

class PastQuestionDetailListWidget extends StatelessWidget {
  const PastQuestionDetailListWidget({
    super.key,
    required this.isOptional,
    required this.isImage,
  });

  final bool isOptional;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Container(
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

            Text('１問目',style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('問題:',style: boldTextStyle,),
            SizedBox(height: 10.h,),
            Text('問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題問題',style: normalTextStyle,),

            SizedBox(height: 15.h,),

            isImage ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('画像:',style: boldTextStyle,),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200.h,
                      child: Image.network("https://dist.micres.cyberowl.jp/u/gallery/8399/s/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCTjRTa0FFPSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--1d0f7ceb5af678638f9fe679ee8ae4e53c729f74/q/80/r/1280x1280"),
                    ),
                  ],
                )
                :
                const SizedBox(),


            SizedBox(height: 15.h,),

            isOptional ?
            const OptionalWidget()
                :
            const SizedBox(),

            Text('解答:',style: boldTextStyle,),
            SizedBox(height: 10.h,),
            Text('解答解答解答解答解答解答解答解答解答',style: normalTextStyle,),

            SizedBox(height: 15.h,),

            Text('解説:',style: boldTextStyle,),
            SizedBox(height: 10.h,),
            Text('解説解説解説解説解説解説解説解説解説解説解説解説',style: normalTextStyle,),





            SizedBox(height: 20.h,),

          ],),
      ),
    );
  }
}

class OptionalWidget extends StatelessWidget {
  const OptionalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i = 0; i<3; i++)... {

          Text('選択肢${i+1}:',style: boldTextStyle,),
          SizedBox(height: 10.h,),
          Text('選択肢${i+1}選択肢${i+1}選択肢${i+1}',style: normalTextStyle,),

          SizedBox(height: 15.h,),

        },
      ],
    );
  }
}