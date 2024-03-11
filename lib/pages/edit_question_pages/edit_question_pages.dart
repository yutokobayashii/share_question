import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/make_question_controller/make_question_controller.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/question_data/question.dart';
import '../../notifier/storage_firestore/storage_firestore_notifier.dart';
import '../../util/dialog/alart_dialog.dart';
import '../../util/snackbar.dart';
import '../../widgets/base_textfield_widget.dart';
import '../../widgets/basic_floating_button.dart';
import '../make_question_pages/make_question_widgets/option_make_question_page.dart';

class EditQuestionPages extends HookConsumerWidget {
  const EditQuestionPages(
      {super.key,
      required this.questionNumber,
      required this.questionDetail,
      required this.questionDetailListValue,
      required this.index});

  final int index;
  final int questionNumber;
  final ValueNotifier<QuestionDetail> questionDetail;
  final ValueNotifier<List<QuestionDetail>> questionDetailListValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionName = useState(questionDetail.value.questionName);
    final correct = useState(questionDetail.value.correctAnswer);
    final explain = useState(questionDetail.value.explanation);
    final questionNameController = useState(
        TextEditingController(text: questionDetail.value.questionName));
    final explainController =
        useState(TextEditingController(text: questionDetail.value.explanation));
    final correctController = useState(
        TextEditingController(text: questionDetail.value.correctAnswer));
    final imageUrlValue = useState(questionDetail.value.image);
    final imagePath = useState<XFile?>(null);
    final isUploadDone = useState(true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              showCupertinoDialog(
                  context: context,
                  title: '戻ると編集した内容が保存されません',
                  content: '本当によろしいですか？',
                  cancelText: 'キャンセル',
                  okText: 'はい',
                  onCancel: () {},
                  onOK: () {
                    Navigator.pop(context);
                  });
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        title: Center(child: Text('$questionNumber問目')),
      ),
      body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      BaseTextFieldWidget(
                        title: '問題',
                        maxLength: 100,
                        height: 70.h,
                        controller: questionNameController.value,
                        onChanged: (text) {
                          questionName.value = text;
                        },
                        onSubmitted: (text) {},
                      ),
                      BasicAddWidget(
                        text: '画像を追加',
                        icon: Icons.add,
                        action: () async {
                          await pickImage(ImageSource.gallery, imagePath);

                          if (imagePath.value == null) {
                            return;
                          }

                          final stringUrl = await ref
                              .read(storageFireStoreNotifierProvider.notifier)
                              .uploadImage(imagePath.value!,isUploadDone);

                          isUploadDone.value = false;

                          imageUrlValue.value = stringUrl;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      (imageUrlValue.value != "" || imagePath.value != null)
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
                                        if (imageUrlValue.value != "") ...{
                                          Image.network(
                                            imageUrlValue.value,
                                            fit: BoxFit.contain,
                                          ),
                                        } else if (imagePath.value != null) ...{
                                          Image.file(
                                              File(imagePath.value!.path),
                                              fit: BoxFit.contain)
                                        },
                                        Positioned(
                                          top: 0, // Containerの外側に配置
                                          right: 0, // Containerの外側に配置
                                          child: GestureDetector(
                                            onTap: () {
                                              imageUrlValue.value = "";
                                              imagePath.value = null;
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
                      BaseTextFieldWidget(
                        title: '正解',
                        maxLength: 100,
                        height: 70.h,
                        controller: correctController.value,
                        onChanged: (text) {
                          correct.value = text;
                        },
                        onSubmitted: (text) {},
                      ),
                      BaseTextFieldWidget(
                        title: '解説',
                        maxLength: 100,
                        height: 70.h,
                        controller: explainController.value,
                        onChanged: (text) {
                          explain.value = text;
                        },
                        onSubmitted: (text) {},
                      ),
                    ],
                  )))),
      floatingActionButton: BasicFloatingButtonWidget(
          text: '修正',
          action: () {
            if (!isUploadDone.value) {
              displayErrorSnackBar(ref,context,"画像のアップロードが完了していません");
            }
            if (questionName.value == "" ||
                correct.value == "" ||
                explain.value == "") {
              if (questionName.value == "") {
                displayErrorSnackBar(ref, context, "問題名を入力してください");
              } else if (correct.value == "") {
                displayErrorSnackBar(ref, context, "正解を入力してください");
              } else if (explain.value == "") {
                displayErrorSnackBar(ref, context, "説明を入力してください");
              }
            } else {
              Navigator.pop(context);

              final newQuestionDetail = QuestionDetail(
                isOptional: false,
                questionName: questionName.value,
                image: imageUrlValue.value,
                correctAnswer: correct.value,
                explanation: explain.value,
                optionalList: [],
              );

              questionDetail.value = newQuestionDetail;

              // 現在のリストのコピーを作成
              List<QuestionDetail> updatedList =
                  List<QuestionDetail>.from(questionDetailListValue.value);

              updatedList[index] = questionDetail.value;

              questionDetailListValue.value = updatedList;
            }
          }),
    );
  }
}
