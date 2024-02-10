import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/notifier/grade/correct_number_notifier.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../../constant/style.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/question_data/question.dart';
import '../../notifier/grade/grade_data_notifier.dart';
import '../../notifier/grade/grade_notifier.dart';
import '../../usecase/grade/grade_data_usecase.dart';
import '../grade_display_pages/grade_display_page.dart';
import 'optional_answer_widget.dart';

class AnswerQuestionPage extends HookConsumerWidget {
  const AnswerQuestionPage({super.key, required this.data});

  final Question data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxNumber = data.questionDetailList.length;
    final currentIndex = useState(0);
    final yourAnswer = useState("");
    final gradeDataUseCase = ref.watch(gradeDataUseCaseProvider);
    final textController = useTextEditingController();

    final questionData = data.questionDetailList[currentIndex.value];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              )),
          title: const Center(child: Text('解答')),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.close,
                size: 28,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: LinearProgressIndicator(
                                value: currentIndex.value / maxNumber,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorSharedPreferenceService().getColor(),
                                ),
                                backgroundColor: Colors.black12,
                                minHeight: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '${currentIndex.value.toString()}/$maxNumber',
                            style: boldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    questionData.questionName,
                    style: boldTextStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  (questionData.image != "")
                      ? Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width - 50.w,
                          height: 200.h,
                          child: Image.network(questionData.image))
                      : const SizedBox(
                          height: 15,
                        ),
                  questionData.isOptional
                      ? OptionalAnswerWidget(
                          options: questionData.optionalList,
                          yourAnswer: yourAnswer,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '記入欄',
                              style: boldTextStyle,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 50.w,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.done,
                                maxLines: 3,
                                maxLength: 50,
                                cursorColor:
                                    ColorSharedPreferenceService().getColor(),
                                controller: textController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorSharedPreferenceService()
                                          .getColor(),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorSharedPreferenceService()
                                          .getColor(),
                                    ),
                                  ),
                                ),
                                onChanged: (text) {},
                                onSubmitted: (text) {
                                  yourAnswer.value = text;
                                },
                              ),
                            )
                          ],
                        ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: BasicFloatingButtonWidget(
          text: '次へ',
          action: () async {


            ///GradeDetailクラスにデータを格納
            ref.watch(gradeDetailListProvider.notifier).addGradeDetail(
                questionData.questionName,
                questionData.correctAnswer,
                yourAnswer.value,
                questionData.explanation);

            ///正解数のカウント
            if (questionData.isOptional) {
              ref.watch(correctNumberProvider.notifier).optionalIncrement(
                  yourAnswer.value, questionData.correctAnswer);
            } else {
              ref.watch(correctNumberProvider.notifier).commentIncrement(
                  yourAnswer.value, questionData.correctAnswer);
            }

            if (currentIndex.value == maxNumber - 1) {
              //indexを追加する前なので-1で調整
              ///最終問題だった場合

              final grade = gradeDataUseCase.getGrade(ref, data); //Gradeに変換

              //todo:ここでuuidですでに登録されているかチェック

              final isExist =
                  await gradeDataUseCase.isGradeExistsInDatabase(grade.uuid);

              if (isExist) {
                await gradeDataUseCase.updateGradeFromSqLite(grade);
              } else {
                await gradeDataUseCase.addGradeToSqFlite(ref, data); //sqfliteに保存
              }

              if (context.mounted) {
                ref.invalidate(gradeListNotifierProvider);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GradeDisplayPage(
                            isFromGradePage: false,
                            gradeData: grade,
                          )),
                );
              }
            } else {
              ///最終問題でない場合

              currentIndex.value++;
            }
          },
        ),
      ),
    );
  }
}
