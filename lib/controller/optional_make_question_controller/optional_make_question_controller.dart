import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/color_shared_preference_service.dart';

class OptionalMakeQuestionController {
  OptionalMakeQuestionController(WidgetRef ref);

  static final optionalController1 = TextEditingController();
  static final optionalController2 = TextEditingController();


  void clearControllers() {
    optionalController1.clear();
    optionalController2.clear();
  }

  void getSnackBar(BuildContext context, WidgetRef ref) {
    if (optionalController1.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              '選択肢1に値が入力されていません',
              style: TextStyle(
                  color: ColorSharedPreferenceService().getColor(),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.white70),
      );
    }
    if (optionalController2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '選択肢2に値が入力されていません',
            style: TextStyle(
                color: ColorSharedPreferenceService().getColor(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white70,
        ),
      );
    }
  }
}
