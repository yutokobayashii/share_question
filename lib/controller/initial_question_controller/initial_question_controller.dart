
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color.dart';
import '../../provider/shared_prefrence_provider.dart';

class InitialQuestionController {

  InitialQuestionController(WidgetRef ref);

  static final questionNameController = TextEditingController();
  static final authorController = TextEditingController();
  static final explainController = TextEditingController();
  static final commentController = TextEditingController();


  void clearControllers() {
    questionNameController.clear();
    authorController.clear();
    explainController.clear();
    commentController.clear();
  }


  void getSnackBar(BuildContext context,WidgetRef ref) {
    if ( questionNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              '問題襲名に値が入力されていません',
              style: TextStyle(
                  color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600

              ),),
            backgroundColor: Colors.white70
        ),
      );
    }
    if (authorController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '作成者に値が入力されていません',
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