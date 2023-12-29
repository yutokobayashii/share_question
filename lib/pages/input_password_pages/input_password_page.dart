
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/widgets/base_textfield_widget.dart';

import '../../widgets/basic_button_widget.dart';
import '../answer_question_pages/answer_question_page.dart';

class InputPasswordPage extends HookConsumerWidget {
  const InputPasswordPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isOnSubmitted = useState(false);
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
                  maxLength: 15,
                  onChanged: (text) {

                  },
                  onSubmitted: (text) {
                    isOnSubmitted.value = true;
                  },
                ),
              ),

              SizedBox(height: 30.h,),

              (isOnSubmitted.value) ? const NewQuestionWidget() :
              Text('パスワードを入力して問題をライブラリに追加しましょう',
                style: normalTextStyle,
              ),



              SizedBox(height: 50.h,),

              (isOnSubmitted.value) ?

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
                    action: () {
                      Navigator.pop(context);
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

class NewQuestionWidget extends StatelessWidget {
  const NewQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -50.w,
    //  height: 300.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
        ),
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),

            Text('問題集名:cfeo coer cec ec問題集',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('作成者:小林優斗',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Text('問題集:10問',
              style: boldTextStyle,),

            SizedBox(height: 15.h,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('説明:',
                  style: boldTextStyle,),
                Text('あああああああああああああああああああああああああああああああ',
                  style: normalTextStyle,),
              ],
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }
}
