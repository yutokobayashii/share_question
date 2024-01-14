
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/color.dart';
import '../provider/shared_prefrence_provider.dart';

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
          color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
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