
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/question_data/question.dart';
import 'package:share_question/widgets/base_textfield_widget.dart';

import '../../constant/style.dart';
import '../../data/local/question_sqflite_dao.dart';
import '../../notifier/cloud_firestore_notifier/cloud_firestore_notifier.dart';
import '../../repository/library/library_data_repoditory.dart';
import '../../usecase/check_new_question/check_new_question_exist_usecase.dart';
import '../../util/snackbar.dart';
import '../../widgets/basic_button_widget.dart';
import 'input_password_widget/new_question_widget.dart';

class InputPasswordPage extends HookConsumerWidget {
  const InputPasswordPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final questionData = useState<Question?>(null);
    final isQuestionExist = useState(false);
    final cloudFireStoreNotifier = ref.watch(cloudFireStoreNotifierProvider.notifier);
    final questionSqfliteDao = QuestionSqfliteDao();
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
              )
          ),
          title: const Center(child: Text('問題を探す')),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.lightbulb_outline,size: 28,),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BaseTextFieldWidget(
                  title: 'パスワードを入力する',
                  maxLength: 20,
                  controller: TextEditingController(),
                  onChanged: (text) {

                  },
                  onSubmitted: (text) async {
                    ///todo:ここですでに追加されている問題の場合のチェックをする
                   questionData.value = await cloudFireStoreNotifier.getQuestion(text);

                   ///トークンが存在しない場合のスナックバーを出す。
                   if (questionData.value == null) {
                     if (context.mounted) {
                       displayErrorSnackBar(ref,context,'入力したパスワードが正しくありません');
                     }

                   }

                   if (CheckNewQuestionExistUseCase().checkExist(ref, questionData.value!)) {
                     isQuestionExist.value = true;
                     if (context.mounted) {
                       displayErrorSnackBar(ref,context,'すでにライブラリに登録されています');
                     }
                   }




                  },
                ),
              ),

              SizedBox(height: 30.h,),

              if (questionData.value != null && isQuestionExist.value == false) ...{
                 NewQuestionWidget(questionData: questionData.value!,)
              } else ...{
                Text('パスワードを入力して問題をライブラリに追加しましょう',
                  style: normalTextStyle,
                ),
              },

              SizedBox(height: 50.h,),

              (questionData.value != null && isQuestionExist.value == false) ?

              BasicButtonWidget(
                title: 'ライブラリに追加する',
                width: MediaQuery.of(context).size.width -50.w,
                height: 60.h,
                action: () async {


                await questionSqfliteDao.addQuestionToDatabase(questionData.value!);

                ref.refresh(libraryRepositoryProvider).isRefreshing;


                if (context.mounted) {
                  Navigator.pop(context);
                }

                },)

                  :
                  const SizedBox()
            ],
          ),
        )
      ),
    );
  }
}


