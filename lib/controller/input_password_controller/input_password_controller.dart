

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color.dart';
import '../../provider/shared_prefrence_provider.dart';

void displayErrorSnackBar (WidgetRef ref,BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
      content: Text(
        '入力したパスワードが正しくありません',
        style: TextStyle(
            color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600

        ),
      ),
      backgroundColor: Colors.white70
  )
  );
}

