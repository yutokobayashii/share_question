
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../guide_page.dart';

class SelectGuideWidget extends StatelessWidget {
  const SelectGuideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [

            const GuideWidget(title: '作問編',),
            SizedBox(height: 20.h,),

            const GuideWidget(title: '解答編',),
            SizedBox(height: 20.h,),

            const GuideWidget(title: '会員ステータス編',),
            SizedBox(height: 20.h,),
          ],
        )
    );
  }
}