import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../../controller/make_question_controller/make_question_controller.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../data/remote/storage_dao.dart';
import '../../entity/question_data/question.dart';
import '../../util/alart_dialog.dart';
import '../../util/snackbar.dart';
import '../../widgets/base_textfield_widget.dart';
import '../make_question_pages/make_question_widgets/option_make_question_page.dart';
import '../make_question_pages/make_question_widgets/select_optional_widget.dart';

class EditOptionalQuestionPages extends HookConsumerWidget {
  const EditOptionalQuestionPages({
        super.key,
        required this.questionNumber,
        required this.index,
        required this.questionDetail,
        required this.questionDetailListValue,


      });

  final int questionNumber;
  final ValueNotifier<QuestionDetail> questionDetail;
  final int index;
  final ValueNotifier<List<QuestionDetail>> questionDetailListValue;

  ///todo;ここでもバリデーションを設定する

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrlValue = useState(questionDetail.value.image);
    final imagePath = useState<XFile?>(null);
    final questionName = useState(questionDetail.value.questionName);
    final explain = useState(questionDetail.value.explanation);
    final correctAnswer = useState(questionDetail.value.correctAnswer);
    final optionalList = useState<List<String>>(questionDetail.value.optionalList);
    final questionNameController = useState(TextEditingController(text: questionDetail.value.questionName));
    final explainController = useState(TextEditingController(text: questionDetail.value.explanation));
    final optionalNumber = useState<int>(optionalList.value.length);
    final isSelectedOptionalItem = useState("0");

    final controllersRef = useRef<List<TextEditingController>?>(null);
    controllersRef.value ??= optionalList.value
          .map((value) => TextEditingController(text: value))
          .toList();

    final controllers = controllersRef.value!;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
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
            child: const Icon(Icons.arrow_back_ios)),
        title: Text('$questionNumber問目'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
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
        
                    if (imagePath.value != null) {
                      final stringUrl = await StorageDao.uploadImageToFirebase(
                          imagePath.value!);
        
                      imageUrlValue.value = stringUrl;
                    }
                  },
                ),
        
                SizedBox(height: 15.h,),
        
                (imageUrlValue.value != "")
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
                                  Image.network(
                                    imageUrlValue.value,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    top: 0, // Containerの外側に配置
                                    right: 0, // Containerの外側に配置
                                    child: GestureDetector(
                                      onTap: () {
                                        imageUrlValue.value = "";
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
                                            color: ColorSharedPreferenceService()
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
        
                Column(
                  children: List.generate(controllers.length, (index) {
                    return BaseTextFieldWidget(
                      title: '選択肢${index + 1}',
                      maxLength: 30,
                      onChanged: (text) {
                        // TextFieldが変更されたときの処理
                      },
                      onSubmitted: (text) {

                        final updatedValues = List<String>.from(optionalList.value);
                        updatedValues[index] = text;
                        optionalList.value = updatedValues;

                      },
                      controller: controllers[index],
                    );
                  }),
                ),

                SelectOptionalWidget(correctAnswer: correctAnswer, optionalList: optionalList, optionalNumber: optionalNumber, isSelectedOptionalItem: isSelectedOptionalItem,),
        
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

                SizedBox(height: 50.h,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: BasicFloatingButtonWidget(
        text: '修正',
        action: () {

          if (questionName.value == "" || correctAnswer.value == "" || explain.value == "") {
            if (questionName.value == ""){
              displayErrorSnackBar(ref,context,"問題名を入力してください");
            }
            else if (correctAnswer.value == "") {
              displayErrorSnackBar(ref,context,"正解を入力してください");
            }
            else if (explain.value == "") {
              displayErrorSnackBar(ref,context,"説明を入力してください");
            }
          } else {
            Navigator.pop(context);

            final newQuestionDetail = QuestionDetail(
                isOptional: true,
                questionName: questionName.value,
                image: imageUrlValue.value,
                correctAnswer: correctAnswer.value,
                explanation: explain.value,
                optionalList: optionalList.value);

            questionDetail.value = newQuestionDetail;


            // 現在のリストのコピーを作成
            List<QuestionDetail> updatedList = List<QuestionDetail>.from(questionDetailListValue.value);

            updatedList[index] = questionDetail.value;

            questionDetailListValue.value = updatedList;
          }







        }

      )
    );
  }
}
