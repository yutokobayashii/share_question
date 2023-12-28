
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_constant.dart';

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget({
    super.key,
    required this.title,
    required this.maxLength,
     this.height = 80,
     this.rightWidget = const SizedBox(),

  });

  final String title;
  final int maxLength;
  final double height;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(width: 5.w,),

            rightWidget


          ],
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          width: MediaQuery.of(context).size.width - 50.w,
          height: height,
          child: TextField(
            maxLength: maxLength,
            cursorColor: baseColor,
            controller: TextEditingController(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: baseColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
