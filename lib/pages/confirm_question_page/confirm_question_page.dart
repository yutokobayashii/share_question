import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/initial_question/initial_question.dart';
import 'package:share_question/notifier/login_notifier/login_notifier.dart';
import 'package:share_question/pages/make_question_pages/make_question_widgets/share_question_page.dart';
import 'package:share_question/repository/question/question_data_repository.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../../controller/make_question_controller/make_question_controller.dart';
import '../../controller/optional_make_question_controller/optional_make_question_controller.dart';
import '../../entity/question_data/question.dart';
import '../../notifier/cloud_firestore_notifier/cloud_firestore_notifier.dart';
import '../../notifier/question_number/question_number_notifier.dart';
import '../../widgets/dialog_widget.dart';
import 'confirm_detail_widget.dart';

class ConfirmQuestionPage extends HookConsumerWidget {
  const ConfirmQuestionPage({
    super.key,
    required this.initial,
    required this.questionDetail,
    required this.author,
  });

  final InitialQuestion initial;
  final List<QuestionDetail> questionDetail;
  final String author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionRepository = QuestionDataRepositoryImp();
    final cloudFireStoreNotifier =
        ref.watch(cloudFireStoreNotifierProvider.notifier);
    final makeQuestionController = MakeQuestionController(ref);
    final optionalController = OptionalMakeQuestionController(ref);
    final questionDetailValue = useState<List<QuestionDetail>>(questionDetail);

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
                        optionalController.clearControllers();
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
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  for (int i = 0; i < questionDetail.length; i++) ...{
                    ConfirmDetailWidget(
                      questionDetail: questionDetailValue.value[i],
                      i: i,
                      questionDetailListValue: questionDetailValue,
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
                final user = await ref
                    .read(loginNotifierProvider.notifier)
                    .getCurrentUser();

                final data = questionRepository.createQuestionData(
                    ref, initial, questionDetailValue.value, user?.uid ?? "");

                final id = await cloudFireStoreNotifier.saveQuestion(data);

                await ref
                    .read(questionNumberNotifierProvider.notifier)
                    .increaseQuestionNumber();

                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShareQuestionPage(
                              id: id,
                              author: initial.author,
                              questionName: initial.name,
                            )),
                  );
                }
              } catch (error) {
                debugPrint('Error writing document: $error');
              }
            },
          )),
    );
  }
}
