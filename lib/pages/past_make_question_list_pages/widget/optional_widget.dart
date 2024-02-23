import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/style.dart';

class OptionalWidget extends StatelessWidget {
  const OptionalWidget({
    super.key,
    required this.optionalList,
  });

  final List<String> optionalList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < optionalList.length; i++) ...{
          Text(
            '選択肢${i + 1}:',
            style: boldTextStyle,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            optionalList[i],
            style: normalTextStyle,
          ),
          SizedBox(
            height: 15.h,
          ),
        },
      ],
    );
  }
}
