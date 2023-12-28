
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_constant.dart';

class BasicButtonWidget extends StatelessWidget {
  const BasicButtonWidget({
    super.key,
    required this.title,
    required this.width,
    required this.action,
      this.height = 45,
  });
  final String title;
  final double width;
  final double height;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: baseColor, // 外枠の色を黒に
            width: 1, // 外枠の太さ
          ),
        ),
        child: Center(child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp
          ),)),
      ),
    );
  }
}