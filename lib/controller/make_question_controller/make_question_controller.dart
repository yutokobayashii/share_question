
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../util/snackbar.dart';


Future<void> pickImage(ImageSource source,ValueNotifier<XFile?> image) async {
  final ImagePicker picker = ImagePicker();
  final XFile? selected = await picker.pickImage(source: source);

  image.value = selected;

}



class MakeQuestionController {


  MakeQuestionController(WidgetRef ref);

 static final questionController = TextEditingController();
  static final correctController = TextEditingController();
  static final commentController = TextEditingController();


  void clearControllers() {
    questionController.clear();
    correctController.clear();
    commentController.clear();
  }



  void getSnackBar(BuildContext context,WidgetRef ref,ValueNotifier<bool> isOptionAnswerTypeState,ValueNotifier<String> name,ValueNotifier<String> correctAnswer,ValueNotifier<String> explanation,ValueNotifier<bool> isUploadDone) {
    if (questionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '問題に値が入力されていません',
            style: TextStyle(
                color: ColorSharedPreferenceService().getColor(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.white70
        ),
      );
    }
    if (correctAnswer.value == "" && isOptionAnswerTypeState.value  == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '正解に値が入力されていません',
            style: TextStyle(
                color: ColorSharedPreferenceService().getColor(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.white70,
        ),
      );
    }
    else if (correctAnswer.value == "" && isOptionAnswerTypeState.value  == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '正解に値が入力されていません',
            style: TextStyle(
                color: ColorSharedPreferenceService().getColor(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.white70,
        ),
      );
    }

    if (explanation.value == "") {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(
            '解説に値が入力されていません',
            style: TextStyle(
            color:ColorSharedPreferenceService().getColor(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

          ),),
          backgroundColor: Colors.white70,
        ),
      );
    }
    if (!isUploadDone.value) {
      displayErrorSnackBar(
          ref, context, "画像のアップロードが完了していません");
    }
  }

}


