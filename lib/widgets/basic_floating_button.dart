
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_constant.dart';

class BasicFloatingButtonWidget extends StatelessWidget {
  const BasicFloatingButtonWidget({
    super.key,
    required this.text,
    required this.action,
  });

  final String text;
  final VoidCallback action;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 70.0,
        width: 70.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: baseColor,
        ),
        child: Center(child:
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700
          ),)),
      ),
    );
  }
}