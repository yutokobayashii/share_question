

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../answer_pages/answer_widgets/question_list_page.dart';
import '../make_question_pages/make_question_widgets/initial_make_question_page.dart';

final dummyList = StateProvider((ref) => ["問題集１","問題集２","問題集３"]);

class DraftListPage extends HookConsumerWidget {
  const DraftListPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('下書き一覧')),
          centerTitle:true,
          leading:
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, size: 28,)),


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
            children: [
              SizedBox(height: 30.h,),
              QuestionListWidget(
                ref: ref,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InitialMakeQuestionPage()),
                  );

                },),

              SizedBox(height: 30.h,),
            ],
          ),
        )
      ),
    );
  }
}
