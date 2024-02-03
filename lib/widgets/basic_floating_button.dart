
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/color_shared_preference_service.dart';

class BasicFloatingButtonWidget extends HookConsumerWidget {
  const BasicFloatingButtonWidget({
    super.key,
    required this.text,
    required this.action,
  });

  final String text;
  final VoidCallback action;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorSharedPreferenceService().getColor(),
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