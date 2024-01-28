
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/controller/input_password_controller/input_password_controller.dart';
import 'package:share_question/data/remote/cloud_dao.dart';
import 'package:share_question/db/shared_preference_db.dart';
import 'package:share_question/entity/question_data/question.dart';
import 'package:share_question/widgets/base_textfield_widget.dart';

import '../../constant/style.dart';
import '../../data/local/question_sqflite_dao.dart';
import '../../notifier/library_data_notifier.dart';
import '../../repository/library_data_repoditory.dart';
import '../../widgets/basic_button_widget.dart';
import '../answer_question_pages/answer_question_page.dart';
import 'input_password_widget/new_question_widget.dart';

class InputPasswordPage extends HookConsumerWidget {
  const InputPasswordPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final questionData = useState<Question?>(null);
    final cloudDao = CloudDao();
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
                   questionData.value = await cloudDao.getQuestion(text);

                   if (questionData.value == null) {
                     if (context.mounted) {
                       displayErrorSnackBar(ref,context);
                     }

                   }
                  },
                ),
              ),

              SizedBox(height: 30.h,),

              if (questionData.value != null) ...{
                 NewQuestionWidget(questionData: questionData.value!,)
              } else ...{
                Text('パスワードを入力して問題をライブラリに追加しましょう',
                  style: normalTextStyle,
                ),
              },

              SizedBox(height: 50.h,),

              (questionData.value != null) ?

              Column(
                children: [
                  BasicButtonWidget(
                    title: 'この問題を解答する',
                    width: MediaQuery.of(context).size.width -50.w,
                    height: 60.h,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnswerQuestionPage()),
                      );

                    },),

                  SizedBox(height: 20.h,),

                  BasicButtonWidget(
                    title: 'ライブラリに追加する',
                    width: MediaQuery.of(context).size.width -50.w,
                    height: 60.h,
                    action: () async {


                   final id = await questionSqfliteDao.addQuestionToDatabase(questionData.value!);



                   ref.refresh(libraryDataProvider).isRefreshing;


                    // ref.watch(sharedPreferencesProvider).setInt("libraryId", id);
                    //
                    // ref.watch(libraryIdProvider.notifier).update((state) => id);


                    if (context.mounted) {
                      Navigator.pop(context);
                    }



                    },),

                ],
              )

                  :
                  const SizedBox()
            ],
          ),
        )
      ),
    );
  }
}


