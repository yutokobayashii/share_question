

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/style.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/question_data/question.dart';
import '../edit_question_pages/edit_optional_question_pages.dart';

class ConfirmDetailWidget extends HookConsumerWidget {
  const ConfirmDetailWidget({
    super.key,
    required this.questionDetail,
    required this.i,
    required this.questionDetailListValue
  });

  final QuestionDetail questionDetail;
  final ValueNotifier<List<QuestionDetail>> questionDetailListValue;
  final int i;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final questionDetailValue = useState<QuestionDetail>(questionDetail);

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width - 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${i + 1}問目', style: boldTextStyle),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditOptionalQuestionPages(questionNumber: i + 1, index: i, questionDetail: questionDetailValue, questionDetailListValue: questionDetailListValue,)),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                '編集する',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight:
                                    FontWeight.w600),
                              ),
                              Icon(
                                Icons.edit_outlined,
                                color:
                                ColorSharedPreferenceService()
                                    .getColor(),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('問題', style: boldTextStyle),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(questionDetailValue.value.questionName,
                    style: normalTextStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  (questionDetail.isOptional)
                      ? Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      for (int i2 = 0;
                      i2 <
                          questionDetail
                              .optionalList
                              .length;
                      i2++) ...{
                        Text('選択肢${i2 + 1}',
                            style: boldTextStyle),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          questionDetail
                              .optionalList[i2],
                          style: normalTextStyle,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      },
                    ],
                  )
                      : const SizedBox(),
                  Text('解答', style: boldTextStyle),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    questionDetailValue.value.correctAnswer,
                    style: normalTextStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('解説', style: boldTextStyle),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    questionDetailValue.value.explanation,
                    style: normalTextStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}