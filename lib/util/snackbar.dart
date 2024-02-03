

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/color_shared_preference_service.dart';

void displayErrorSnackBar (WidgetRef ref,BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            text,
            style: TextStyle(
                color: ColorSharedPreferenceService().getColor(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),
          ),
          backgroundColor: Colors.white70
      )
  );
}

