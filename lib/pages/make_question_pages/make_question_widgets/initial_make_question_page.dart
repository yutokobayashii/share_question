import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/controller/initial_question_controller/initial_question_controller.dart';
import 'package:share_question/notifier/initial_question_notifier/initial_question_notifier.dart';

import '../../../widgets/base_textfield_widget.dart';
import '../../../widgets/basic_floating_button.dart';
import '../../../widgets/dialog_widget.dart';
import '../make_question_page.dart';

class InitialMakeQuestionPage extends HookConsumerWidget {
  const InitialMakeQuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = InitialQuestionController(ref);
    final name = useState("");
    final author = useState("");
    final explain = useState("");
    final comment = useState("");
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: GestureDetector(
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
                              Navigator.pop(context);
                              controller.clearControllers();
                            },
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      )),
                  title: const Text('作問'),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          BaseTextFieldWidget(
                            title: '問題集名',
                            maxLength: 30,
                            rightWidget: const IsRequiredWidget(),
                            controller: InitialQuestionController
                                .questionNameController,
                            onChanged: (text) {
                              name.value = text;
                            },
                            onSubmitted: (text) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          BaseTextFieldWidget(
                            title: '作成者名',
                            maxLength: 15,
                            rightWidget: const IsRequiredWidget(),
                            controller:
                                InitialQuestionController.authorController,
                            onChanged: (text) {
                              author.value = text;
                            },
                            onSubmitted: (text) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          BaseTextFieldWidget(
                            title: '問題集の説明',
                            maxLength: 100,
                            rightWidget: const IsRequiredWidget(),
                            controller:
                                InitialQuestionController.explainController,
                            onChanged: (text) {
                              explain.value = text;
                            },
                            onSubmitted: (text) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          BaseTextFieldWidget(
                            title: '解答した人へのコメント',
                            maxLength: 100,
                            rightWidget: const IsRequiredWidget(),
                            controller:
                                InitialQuestionController.commentController,
                            onChanged: (text) {
                              comment.value = text;
                            },
                            onSubmitted: (text) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                floatingActionButton:  BasicFloatingButtonWidget(
                        text: '次へ',
                        action: () async {
                          if (InitialQuestionController
                                  .questionNameController.text.isEmpty ||
                              InitialQuestionController
                                  .authorController.text.isEmpty ||
                              InitialQuestionController
                                  .explainController.text.isEmpty ||
                              InitialQuestionController
                                  .commentController.text.isEmpty) {
                            controller.getSnackBar(context, ref);
                          } else {
                            controller.clearControllers();

                            final initial = ref
                                .read(initialQuestionNotifierProvider.notifier)
                                .get(name.value, author.value, explain.value,
                                    comment.value);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MakeQuestionPage(
                                        initial: initial,
                                      )),
                            );
                          }
                        },
                      )),
          );
        });
  }
}

class IsRequiredWidget extends StatelessWidget {
  const IsRequiredWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '必須',
          style: TextStyle(
              color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
