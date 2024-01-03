
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_question/provider/make_question_provider.dart';

import '../../constant/color_constant.dart';
import '../../provider/shared_prefrence_provider.dart';


Future<void> pickImage(ImageSource source,WidgetRef ref) async {
  final ImagePicker picker = ImagePicker();
  final XFile? selected = await picker.pickImage(source: source);

  ref.watch(MakeQuestionProvider.imageFileProvider.notifier).update((state) => selected);
}



class OptionMakeQuestionController {

  OptionMakeQuestionController(WidgetRef ref);

 static final questionController = TextEditingController();
  static final correctController = TextEditingController();
  static final commentController = TextEditingController();


  void clearControllers() {
    questionController.clear();
    correctController.clear();
    commentController.clear();
  }

  void getSnackBar(BuildContext context,WidgetRef ref) {
    if (questionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '問題に値が入力されていません',
            style: TextStyle(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.grey,
        ),
      );
    }
    if (correctController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '正解に値が入力されていません',
            style: TextStyle(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.grey,
        ),
      );
    }
    if (commentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(
            '解説に値が入力されていません',
            style: TextStyle(
            color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

          ),),
          backgroundColor: Colors.grey,
        ),
      );
    }
  }

}