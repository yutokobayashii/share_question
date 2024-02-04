import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/style.dart';
import '../home_pages/home_widgets/main_home_widget.dart';
import '../input_password_pages/input_password_page.dart';
import 'answer_widgets/question_list_page.dart';



class AnswerPage extends HookConsumerWidget {
  const AnswerPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("解答"),
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

            SizedBox(height: 30.h,),

            Align(
              alignment: Alignment.center,
              child: MainHomeWidget(
                width: MediaQuery.of(context).size.width - 80.w,
                icon: const Icon(Icons.add,size: 30,),
                title: 'パスワードを入力',
                content: 'あなたのライブラリに問題が追加されます',
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputPasswordPage()),
                  );
                },
              ),
            ),

            SizedBox(height: 30.h,),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text('あなたのライブラリ',
                         style: boldTextStyle,),

                     const Icon(Icons.bookmark_outline,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h,),

            const QuestionListWidget(
              removeContent:'一度削除すると再度パスワードを入力しないと問題にアクセスできません',
              )
          ],
        ),
      ),
    );
  }
}

