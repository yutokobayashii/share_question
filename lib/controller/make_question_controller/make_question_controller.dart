
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_question/provider/make_question_provider.dart';

import '../../constant/color_constant.dart';
import '../../model/question_model/question.dart';
import '../../provider/shared_prefrence_provider.dart';


Future<void> pickImage(ImageSource source,WidgetRef ref) async {
  final ImagePicker picker = ImagePicker();
  final XFile? selected = await picker.pickImage(source: source);

  ref.watch(MakeQuestionProvider.imageFileProvider.notifier).update((state) => selected);
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

  void inputData(WidgetRef ref,QuestionDetail? temList,ValueNotifier<bool> isOptionAnswerTypeState) {
    temList = QuestionDetail(
        isOptional: isOptionAnswerTypeState.value,
        questionName: ref.watch(
            MakeQuestionProvider
                .questionProvider),
        image: ref.watch(
            MakeQuestionProvider.imageProvider),
        correctAnswer: ref.watch(
            MakeQuestionProvider.correctProvider),
        explanation: ref.watch(
            MakeQuestionProvider.commentProvider),
        optionalList: (isOptionAnswerTypeState
            .value) ?
        [
          for(int i = 0; i < ref.watch(
              MakeQuestionProvider
                  .optionalNumber); i++) ...{
            OptionalQuestion(optional: ref.watch(
                MakeQuestionProvider
                    .optionalProvider(i + 1)))
          }
        ]
            : []
    );

    ref.watch(MakeQuestionProvider
        .questionDetailListProvider).add(
        temList);

    ref.watch(MakeQuestionProvider
        .questionDetailListProvider.notifier)
        .update((state) => ref.watch(
        MakeQuestionProvider
            .questionDetailListProvider));

  }



  void getSnackBar(BuildContext context,WidgetRef ref,ValueNotifier<bool> isOptionAnswerTypeState) {
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
          backgroundColor: Colors.white70
        ),
      );
    }
    if (correctController.text.isEmpty && isOptionAnswerTypeState.value  == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '正解に値が入力されていません',
            style: TextStyle(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.white70,
        ),
      );
    }
    else if (ref.watch(MakeQuestionProvider.correctProvider) == "" && isOptionAnswerTypeState.value  == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '正解に値が入力されていません',
            style: TextStyle(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600

            ),),
          backgroundColor: Colors.white70,
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
          backgroundColor: Colors.white70,
        ),
      );
    }
  }

}