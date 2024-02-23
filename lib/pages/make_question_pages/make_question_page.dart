import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_question/controller/optional_make_question_controller/optional_make_question_controller.dart';
import 'package:share_question/controller/remove_data_controller/remove_data_controller.dart';

import '../../controller/make_question_controller/make_question_controller.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../data/remote/storage_dao.dart';
import '../../entity/initial_question/initial_question.dart';
import '../../entity/question_data/question.dart';
import '../../notifier/question_detail/question_detail_notifier.dart';
import '../../widgets/base_textfield_widget.dart';
import '../../widgets/basic_button_widget.dart';
import '../../widgets/dialog_widget.dart';
import '../confirm_question_page/confirm_question_page.dart';
import 'make_question_widgets/option_make_question_page.dart';
import 'make_question_widgets/select_optional_widget.dart';

class MakeQuestionPage extends HookConsumerWidget {
  const MakeQuestionPage({
    super.key,
    required this.initial
  });

  final InitialQuestion initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOptionAnswerTypeState = useState(false);
    final questionNumber = useState(1);
    final controller = MakeQuestionController(ref);
    final optionalController = OptionalMakeQuestionController(ref);
    final removeQuestionDataController = RemoveDataController();
    final questionDetailList = useState<List<QuestionDetail>>([]);
    final name = useState<String>("");
    final imagePath = useState<XFile?>(null);
    final imageUrl = useState("");
    final correctAnswer = useState("");
    final explanation = useState("");
    final optionalList = useState<List<String>>([]);

    ///ここに下記のusestateを作成してそれを次の問題に遷移する際にref.watch(questionDetailNotifierProvider)でQuestionDetailのクラスを作成する
    ///→それをquestionDetailListの要素として保存する。
    ///→それを最終問題時にconfirm_pagesに持たせる


    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context1) =>
                            AlertDialogWidget(
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
                                // removeQuestionDataController
                                //     .removeInitialQuestionData(ref);
                                removeQuestionDataController.removeOptionData(
                                    ref);
                                removeQuestionDataController
                                    .removeMakeQuestionData(ref);
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
                title: Center(child: Text('${questionNumber.value}問目')),
                actions: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context1) =>
                              AlertDialogWidget(
                                title: 'ここまでの作問を保存しますか？',
                                content: '保存した作問は後から再開できます',
                                leftText: '作問を続ける',
                                rightText: '保存する',
                                rightAction: () {
                                  debugPrint('保存しました');
                                  Navigator.pop(context1);
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                leftAction: () {
                                  Navigator.pop(context1);
                                },
                              ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.description_outlined,
                        size: 28,
                      ),
                    ),
                  ),
                ],
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
                              height: 70.h,
                              controller:
                              MakeQuestionController.questionController,
                              onChanged: (text) {
                                name.value = text;
                              },
                              onSubmitted: (text) {},
                            ),
                            BasicAddWidget(
                              text: '画像を追加',
                              icon: Icons.add,
                              action: () async {
                                await pickImage(ImageSource.gallery, imagePath);

                                if (imagePath.value != null) {
                                  final stringUrl =
                                  await StorageDao.uploadImageToFirebase(
                                      imagePath.value!);

                                  imageUrl.value = stringUrl;
                                }
                              },
                            ),
                            (imagePath.value !=
                                null)
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
                                        Positioned(
                                          top: 0, // Containerの外側に配置
                                          right: 0, // Containerの外側に配置
                                          child: GestureDetector(
                                            onTap: () {
                                              imagePath.value = null;
                                              imageUrl.value = "";
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color:
                                                    ColorSharedPreferenceService()
                                                        .getColor(),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color:
                                                  ColorSharedPreferenceService()
                                                      .getColor(),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : const SizedBox(),
                            (isOptionAnswerTypeState.value)
                                ? const OptionMakeQuestionWidget()
                                : SizedBox(
                              height: 15.h,
                            ),
                            (isOptionAnswerTypeState.value)
                                ? Align(
                                alignment: Alignment.topLeft,
                                child: SelectOptionalWidget(correctAnswer: correctAnswer,))
                                : BaseTextFieldWidget(
                              title: '正解',
                              maxLength: 30,
                              height: 70.h,
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
                              height: 70.h,
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
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2 -
                                      35.w,
                                  action: () {
                                    if (isOptionAnswerTypeState.value == true) {
                                      ///選択肢の場合

                                      if (explanation.value == "" ||
                                          name.value == "" ||
                                          correctAnswer.value ==
                                              "" ||
                                          OptionalMakeQuestionController
                                              .optionalController1
                                              .text
                                              .isEmpty ||
                                          OptionalMakeQuestionController
                                              .optionalController2
                                              .text
                                              .isEmpty

                                      ///未記入がある場合
                                      ) {
                                        controller.getSnackBar(context, ref,
                                            isOptionAnswerTypeState,name,correctAnswer,explanation);

                                        optionalController.getSnackBar(
                                            context, ref);
                                      } else {
                                        ///未記入がない場合

                                        final detail = ref.read(
                                            questionDetailNotifierProvider
                                                .notifier).getQuestionDetail(
                                            isOptionAnswerTypeState.value,
                                            name.value, imageUrl.value,
                                            correctAnswer.value,
                                            explanation.value,
                                            optionalList.value);

                                        final updatedList = List<
                                            QuestionDetail>.from(
                                            questionDetailList.value)
                                          ..add(detail);

                                        questionDetailList.value = updatedList;

                                        questionNumber.value = 1;

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmQuestionPage(
                                                    initial: initial, questionDetail: questionDetailList.value,)),
                                        );
                                      }
                                    } else {
                                      ///記述の場合

                                      if (explanation.value == "" ||
                                          name.value == "" ||
                                          correctAnswer.value ==
                                              ""

                                      ///未記入がある場合
                                      ) {
                                        controller.getSnackBar(context, ref,
                                            isOptionAnswerTypeState,name,correctAnswer,explanation);

                                      } else {
                                        ///未記入がない場合
                                        final detail = ref.read(
                                            questionDetailNotifierProvider
                                                .notifier).getQuestionDetail(
                                            isOptionAnswerTypeState.value,
                                            name.value, imageUrl.value,
                                            correctAnswer.value,
                                            explanation.value,
                                            optionalList.value);

                                        final updatedList = List<
                                            QuestionDetail>.from(
                                            questionDetailList.value)
                                          ..add(detail);

                                        questionDetailList.value = updatedList;

                                        questionNumber.value = 1;

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmQuestionPage(
                                                    initial: initial, questionDetail: questionDetailList.value,)),
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
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2 -
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
                                              .isEmpty) {
                                        controller.getSnackBar(context, ref,
                                            isOptionAnswerTypeState,name,correctAnswer,explanation);
                                        //ここのロジックもかえる

                                        optionalController.getSnackBar(
                                            context, ref);
                                      } else {
                                        questionNumber.value++;

                                        final detail = ref.read(
                                            questionDetailNotifierProvider
                                                .notifier).getQuestionDetail(
                                            isOptionAnswerTypeState.value,
                                            name.value, imageUrl.value,
                                            correctAnswer.value,
                                            explanation.value,
                                            optionalList.value);

                                        final updatedList = List<
                                            QuestionDetail>.from(
                                            questionDetailList.value)
                                          ..add(detail);

                                        questionDetailList.value = updatedList;

                                        removeQuestionDataController
                                            .removeOptionData(ref);

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;
                                      }
                                    } else {
                                      if (explanation.value == "" ||
                                          name.value == "" ||
                                          correctAnswer.value ==
                                              "") {
                                        controller.getSnackBar(context, ref,
                                            isOptionAnswerTypeState,name,correctAnswer,explanation);

                                        optionalController.getSnackBar(
                                            context, ref);
                                      } else {
                                        questionNumber.value++;

                                        final detail = ref.read(
                                            questionDetailNotifierProvider
                                                .notifier).getQuestionDetail(
                                            isOptionAnswerTypeState.value,
                                            name.value, imageUrl.value,
                                            correctAnswer.value,
                                            explanation.value,
                                            optionalList.value);

                                        final updatedList = List<
                                            QuestionDetail>.from(
                                            questionDetailList.value)
                                          ..add(detail);

                                        questionDetailList.value = updatedList;


                                        removeQuestionDataController
                                            .removeOptionData(ref);

                                        controller.clearControllers();

                                        optionalController.clearControllers();

                                        isOptionAnswerTypeState.value = false;
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
