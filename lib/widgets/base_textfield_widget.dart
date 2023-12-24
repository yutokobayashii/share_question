
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_constant.dart';

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget({
    super.key,
    required this.title,
    required this.isRequired,
    required this.maxLength,
     this.height = 80,

  });

  final String title;
  final bool isRequired;
  final int maxLength;
  final double height;

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
            isRequired ?
            Container(
              width: 40.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  '必須',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            )
                :
            const SizedBox()
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
