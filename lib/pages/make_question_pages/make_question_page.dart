import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_question/controller/optional_make_question_controller/optional_make_question_controller.dart';

import '../../controller/make_question_controller/make_question_controller.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/initial_question/initial_question.dart';
import '../../entity/question_data/question.dart';
import '../../notifier/question_detail/question_detail_notifier.dart';
import '../../notifier/storage_firestore/storage_firestore_notifier.dart';
import '../../util/snackbar.dart';
import '../../widgets/base_textfield_widget.dart';
import '../../widgets/basic_button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../confirm_question_page/confirm_question_page.dart';
import 'make_question_widgets/option_make_question_page.dart';
import 'make_question_widgets/select_optional_widget.dart';

class MakeQuestionPage extends HookConsumerWidget {
  const MakeQuestionPage({super.key, required this.initial});

  final InitialQuestion initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOptionAnswerTypeState = useState(false);
    final questionNumber = useState(1);
    final controller = MakeQuestionController(ref);
    final optionalController = OptionalMakeQuestionController(ref);
    final questionDetailList = useState<List<QuestionDetail>>([]);
    final name = useState<String>("");
    final isUploadDone = useState<bool>(true); //そもそも画像をアップロードしない場合もあるので初期値はtrue
    final imagePath = useState<XFile?>(null);
    final imageUrl = useState("");
    final correctAnswer = useState("");
    final explanation = useState("");
    final optionalList = useState<List<String>>(["", ""]);
    final optionalNumber = useState(2);
    final isSelectedOptionalItem = useState("0");
    final imageNumber = useState(0);

    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context1) => AlertDialogWidget(
                          title: '作問を中止しますか？',
                          content: '中止すると入力した項目は保存されません',
                          leftText: '中止する',
                          rightText: '続ける',
                          rightAction: () {
                            Navigator.pop(context1);
                          },
                          leftAction: () {
                            Navigator.pop(context1);
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            controller.clearControllers();
                            optionalController.clearControllers();
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text('${questionNumber.value}問目'),
              ),
              body: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "解答方法",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                    onTap: isOptionAnswerTypeState.value
                                        ? null
                                        : () {
                                            isOptionAnswerTypeState.value =
                                                true;
                                          },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          child: isOptionAnswerTypeState.value
                                              ? Center(
                                                  child: Container(
                                                    width: 12.5.w,
                                                    height: 12.5.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorSharedPreferenceService()
                                                              .getColor(),
                                                    ),
                                                  ),
                                                )
                                              : null,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '選択肢',
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                    onTap: isOptionAnswerTypeState.value
                                        ? () {
                                            isOptionAnswerTypeState.value =
                                                false;
                                          }
                                        : null,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          child: isOptionAnswerTypeState.value
                                              ? null
                                              : Center(
                                                  child: Container(
                                                    width: 12.5.w,
                                                    height: 12.5.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          ColorSharedPreferenceService()
                                                              .getColor(),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '記入式',
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            BaseTextFieldWidget(
                              title: '問題',
                              maxLength: 100,
                              height: 90.h,
                              controller:
                                  MakeQuestionController.questionController,
                              onChanged: (text) {
                                name.value = text;
                              },
                              onSubmitted: (text) {},
                            ),
                            (imageNumber.value > 5) ?
                                const Text('画像枚数上限に達しました。有料会員になれば無制限で画像を挿入できます。')
                                :
                            BasicAddWidget(
                              text: '画像を追加',
                              icon: (imagePath.value != null)
                                  ? Icons.close
                                  : Icons.add,
                              action: (imagePath.value != null)
                                  //×ボタン押下時
                                  ? () {
                                      imagePath.value = null;
                                      imageUrl.value = "";
                                      imageNumber.value--;
                                    }
                                  : () async {
                                      //➕ボタン押下時
                                      imageNumber.value++;
                                      await pickImage(
                                          ImageSource.gallery, imagePath);

                                      if (imagePath.value != null) {
                                        final stringUrl = await ref
                                            .read(
                                                storageFireStoreNotifierProvider
                                                    .notifier)
                                            .uploadImage(
                                                imagePath.value!, isUploadDone);

                                        isUploadDone.value = true;

                                        imageUrl.value = stringUrl;
                                      }
                                    },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    // デフォルトのスタイルを設定します
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(text: '※今回の作問で使用できる画像は残り',
                                          style: TextStyle(
                                            color: Colors.black38
                                          )),
                                      TextSpan(
                                        text:
                                            (5 - imageNumber.value).toString(),
                                        style: const TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(
                                        text: "枚です。",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black38,
                                        ),
                                      ),
                                  const TextSpan(
                                    text: "\n有料会員になれば無制限で画像を挿入できます。",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black38,
                                    ),
                                  ),

                                    ]),
                              ),
                            ),
                            (imagePath.value != null)
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          color: Colors.white,
                                          width: 250.w,
                                          height: 200.h,
                                          child: Stack(
                                            children: [
                                              Image.file(
                                                File(imagePath.value!.path),
                                                fit: BoxFit.contain,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            (isOptionAnswerTypeState.value)
                                ? OptionMakeQuestionWidget(
                                    optionalList: optionalList,
                                    isSelectedOptionalItem:
                                        isSelectedOptionalItem,
                                    optionalNumber: optionalNumber,
                                  )
                                : SizedBox(
                                    height: 15.h,
                                  ),
                            (isOptionAnswerTypeState.value)
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: SelectOptionalWidget(
                                      correctAnswer: correctAnswer,
                                      optionalList: optionalList,
                                      optionalNumber: optionalNumber,
                                      isSelectedOptionalItem:
                                          isSelectedOptionalItem,
                                    ))
                                : BaseTextFieldWidget(
                                    title: '正解',
                                    maxLength: 30,
                                    height: 90.h,
                                    controller: MakeQuestionController
                                        .correctController,
                                    onChanged: (text) {
                                      correctAnswer.value = text;
                                    },
                                    onSubmitted: (text) {},
                                  ),
                            BaseTextFieldWidget(
                              title: '解説',
                              maxLength: 100,
                              height: 90.h,
                              controller:
                                  MakeQuestionController.commentController,
                              onChanged: (text) {
                                explanation.value = text;
                              },
                              onSubmitted: (text) {},
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BasicButtonWidget(
                                  title: '最終確認へ',
                                  width: MediaQuery.of(context).size.width / 2 -
                                      35.w,
                                  action: () {
                                    if (!isUploadDone.value) {
                                      displayErrorSnackBar(
                                          ref, context, "画像のアップロードが完了していません");
                                    }
                                    if (isOptionAnswerTypeState.value == true) {
                                      ///選択肢の場合

                                      if (explanation.value == "" ||
                                              name.value == "" ||
                                              correctAnswer.value == "" ||
                                              OptionalMakeQuestionController
                                                  .optionalController1
                                                  .text
                                                  .isEmpty ||
                                              OptionalMakeQuestionController
                                                  .optionalController2
                                                  .text
                                                  .isEmpty
                                      || !isUploadDone.value

                                          ///未記入がある場合
                                          ) {
                                        controller.getSnackBar(
                                            context,
                                            ref,
                                            isOptionAnswerTypeState,
                                            name,
                                            correctAnswer,
                                            explanation,isUploadDone);

                                        optionalController.getSnackBar(
                                            context, ref);
                                      } else {
                                        ///未記入がない場合

                                        final detail = ref
                                            .read(questionDetailNotifierProvider
                                                .notifier)
                                            .getQuestionDetail(
                                                isOptionAnswerTypeState.value,
                                                name.value,
                                                imageUrl.value,
                                                correctAnswer.value,
                                                explanation.value,
                                                optionalList.value);

                                        final updatedList =
                                            List<QuestionDetail>.from(
                                                questionDetailList.value)
                                              ..add(detail);

                                        questionDetailList.value = updatedList;

                                        questionNumber.value = 1;

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;

                                        imageUrl.value = "";

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmQuestionPage(
                                                    initial: initial,
                                                    questionDetail:
                                                        questionDetailList
                                                            .value,
                                                    author: initial.author,
                                                  )),
                                        );
                                      }
                                    } else {
                                      ///記述の場合

                                      if (explanation.value == "" ||
                                              name.value == "" ||
                                              correctAnswer.value == ""

                                          ///未記入がある場合
                                          ) {
                                        controller.getSnackBar(
                                            context,
                                            ref,
                                            isOptionAnswerTypeState,
                                            name,
                                            correctAnswer,
                                            explanation,isUploadDone);
                                      } else {
                                        ///未記入がない場合
                                        final detail = ref
                                            .read(questionDetailNotifierProvider
                                                .notifier)
                                            .getQuestionDetail(
                                                isOptionAnswerTypeState.value,
                                                name.value,
                                                imageUrl.value,
                                                correctAnswer.value,
                                                explanation.value,
                                                optionalList.value);

                                        final updatedList =
                                            List<QuestionDetail>.from(
                                                questionDetailList.value)
                                              ..add(detail);

                                        questionDetailList.value = updatedList;

                                        questionNumber.value = 1;

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;

                                        imageUrl.value = "";
                                        imagePath.value = null;

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmQuestionPage(
                                                    initial: initial,
                                                    questionDetail:
                                                        questionDetailList
                                                            .value,
                                                    author: initial.author,
                                                  )),
                                        );
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                BasicButtonWidget(
                                  title: '${questionNumber.value + 1}問目へ',
                                  width: MediaQuery.of(context).size.width / 2 -
                                      35.w,
                                  action: () {
                                    if (isOptionAnswerTypeState.value == true) {
                                      if (explanation.value == "" ||
                                          name.value == "" ||
                                          correctAnswer.value == "" ||
                                          OptionalMakeQuestionController
                                              .optionalController1
                                              .text
                                              .isEmpty ||
                                          OptionalMakeQuestionController
                                              .optionalController2
                                              .text
                                              .isEmpty||
                                          !isUploadDone.value) {
                                        controller.getSnackBar(
                                            context,
                                            ref,
                                            isOptionAnswerTypeState,
                                            name,
                                            correctAnswer,
                                            explanation,isUploadDone);
                                        //ここのロジックもかえる

                                        optionalController.getSnackBar(
                                            context, ref);
                                      } else {
                                        questionNumber.value++;

                                        final detail = ref
                                            .read(questionDetailNotifierProvider
                                                .notifier)
                                            .getQuestionDetail(
                                                isOptionAnswerTypeState.value,
                                                name.value,
                                                imageUrl.value,
                                                correctAnswer.value,
                                                explanation.value,
                                                optionalList.value);

                                        final updatedList =
                                            List<QuestionDetail>.from(
                                                questionDetailList.value)
                                              ..add(detail);

                                        questionDetailList.value = updatedList;

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;

                                        imageUrl.value = "";

                                        imagePath.value = null;
                                      }
                                    } else {
                                      if (explanation.value == "" ||
                                          name.value == "" ||
                                          correctAnswer.value == "") {
                                        controller.getSnackBar(
                                            context,
                                            ref,
                                            isOptionAnswerTypeState,
                                            name,
                                            correctAnswer,
                                            explanation,isUploadDone);

                                        optionalController.getSnackBar(
                                            context, ref);
                                      } else {
                                        questionNumber.value++;

                                        final detail = ref
                                            .read(questionDetailNotifierProvider
                                                .notifier)
                                            .getQuestionDetail(
                                                isOptionAnswerTypeState.value,
                                                name.value,
                                                imageUrl.value,
                                                correctAnswer.value,
                                                explanation.value,
                                                optionalList.value);

                                        final updatedList =
                                            List<QuestionDetail>.from(
                                                questionDetailList.value)
                                              ..add(detail);

                                        questionDetailList.value = updatedList;

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;

                                        imageUrl.value = "";

                                        imagePath.value = null;
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
