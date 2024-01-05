



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color_constant.dart';
import '../../provider/shared_prefrence_provider.dart';




class OptionalMakeQuestionController {

  OptionalMakeQuestionController(WidgetRef ref);

  static final optionalController1 = TextEditingController();
  static final optionalController2 = TextEditingController();
  static final optionalController3 = TextEditingController();
  static final optionalController4 = TextEditingController();
  static final optionalController5 = TextEditingController();
  static final optionalController6 = TextEditingController();


  void clearControllers() {
    optionalController1.clear();
    optionalController2.clear();
    optionalController3.clear();
    optionalController4.clear();
    optionalController5.clear();
    optionalController6.clear();
  }






  void getSnackBar(BuildContext context,WidgetRef ref) {

      if (optionalController1.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              '選択肢1に値が入力されていません',
              style: TextStyle(
                  color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600

              ),),
            backgroundColor: Colors.white70
        ),
      );
    }
    if (optionalController2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '選択肢2に値が入力されていません',
            style: TextStyle(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.white70,
        ),
      );
    }

  }
}