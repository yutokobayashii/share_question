
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/color_constant.dart';
import '../provider/shared_prefrence_provider.dart';

class BasicButtonWidget extends HookConsumerWidget {
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
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
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