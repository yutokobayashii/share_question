
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/color.dart';
import '../provider/shared_prefrence_provider.dart';

class BaseTextFieldWidget extends HookConsumerWidget {
  const BaseTextFieldWidget({
    super.key,
    required this.title,
    required this.maxLength,
    required this.onChanged,
    required this.onSubmitted,
    required this.controller,

     this.height = 80,
     this.rightWidget = const SizedBox(),

  });

  final String title;
  final int maxLength;
  final double height;
  final Widget rightWidget;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
            cursorColor: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
            controller: controller,
            decoration:  InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value)),
              ),
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          ),
        )
      ],
    );
  }
}
