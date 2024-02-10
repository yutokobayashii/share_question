import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/pages/make_question_pages/make_question_widgets/share_question_page.dart';
import 'package:share_question/provider/make_question_provider.dart';
import 'package:share_question/repository/question/question_data_repository.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../../../constant/style.dart';
import '../../../controller/confirm_question_controller/confirm_question_controller.dart';
import '../../../controller/make_question_controller/make_question_controller.dart';
import '../../../controller/optional_make_question_controller/optional_make_question_controller.dart';
import '../../../controller/remove_data_controller/remove_data_controller.dart';
import '../../../data/local/color_shared_preference_service.dart';
import '../../../notifier/cloud_firestore_notifier/cloud_firestore_notifier.dart';
import '../../../widgets/dialog_widget.dart';

class ConfirmQuestionPage extends HookConsumerWidget {
  const ConfirmQuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionRepository = QuestionDataRepositoryImp();
    final controller = ConfirmQuestionController();
    final removeDataController = RemoveDataController();
    final cloudFireStoreNotifier = ref.watch(cloudFireStoreNotifierProvider.notifier);
    final makeQuestionController = MakeQuestionController(ref);
    final optionalController = OptionalMakeQuestionController(ref);
    final removeQuestionDataController = RemoveDataController();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(right: 15),
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
                        Navigator.popUntil(context, (route) => route.isFirst);
                        makeQuestionController.clearControllers();
                        removeQuestionDataController
                            .removeInitialQuestionData(ref);
                        removeQuestionDataController.removeOptionData(ref);
                        removeQuestionDataController
                            .removeMakeQuestionData(ref);
                        optionalController.clearControllers();
                        ref
                            .watch(MakeQuestionProvider
                                .isSelectedItemProvider.notifier)
                            .update((state) => "0");
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.close,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            title:
                const Align(alignment: Alignment.center, child: Text('最終確認')),
            actions: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context1) => AlertDialogWidget(
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
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  for (int i = 0;
                      i <
                          ref
                              .watch(MakeQuestionProvider
                                  .questionDetailListProvider)
                              .length;
                      i++) ...{
                    Align(
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
                                        child: Row(
                                          children: [
                                            Text(
                                              '編集する',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Icon(
                                              Icons.edit_outlined,
                                              color:
                                                  ColorSharedPreferenceService()
                                                      .getColor(),
                                            )
                                          ],
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
                                  Text(
                                    ref
                                        .watch(MakeQuestionProvider
                                            .questionDetailListProvider)[i]
                                        .questionName,
                                    style: normalTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  (ref
                                          .watch(MakeQuestionProvider
                                              .questionDetailListProvider)[i]
                                          .isOptional)
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (int i2 = 0;
                                                i2 <
                                                    ref
                                                        .watch(
                                                            MakeQuestionProvider
                                                                .questionDetailListProvider)[
                                                            i]
                                                        .optionalList
                                                        .length;
                                                i2++) ...{
                                              Text('選択肢${i2 + 1}',
                                                  style: boldTextStyle),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                ref
                                                    .watch(MakeQuestionProvider
                                                        .questionDetailListProvider)[i]
                                                    .optionalList[i2]
                                                    .optional,
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
                                    ref
                                        .watch(MakeQuestionProvider
                                            .questionDetailListProvider)[i]
                                        .correctAnswer,
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
                                    ref
                                        .watch(MakeQuestionProvider
                                            .questionDetailListProvider)[i]
                                        .explanation,
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
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  },
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: BasicFloatingButtonWidget(
            text: '共有',
            action: () async {
              try {
                final data = questionRepository.createQuestionData(ref);

                final id = await cloudFireStoreNotifier.saveQuestion(data);

                controller.putQuestionDataToIsar(id, ref);

                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShareQuestionPage(
                              id: id,
                            )),
                  );
                }

                removeDataController.removeInitialQuestionData(ref);
                removeDataController.removeMakeQuestionData(ref);
              } catch (error) {
                debugPrint('Error writing document: $error');
              }
            },
          )),
    );
  }
}
