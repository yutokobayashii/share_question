import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/error.dart';
import 'package:share_question/controller/share_controller.dart';
import 'package:share_question/pages/past_question_detail_page/past_question_detail_widget.dart';
import 'package:share_question/widgets/basic_button_widget.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../notifier/cloud_firestore_notifier/cloud_firestore_notifier.dart';


class PastQuestionDetailPage extends HookConsumerWidget {
  const PastQuestionDetailPage(this.documentId, this.author, this.questionName, {
    super.key
  });

  final String documentId;
  final String author;
  final String questionName;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cloudFireStoreNotifier = ref.watch(cloudFireStoreNotifierProvider.notifier);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('作問詳細')),
          centerTitle:true,
          leading:
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, size: 28,)),
          actions: const [SizedBox()],


        ),
        body: FutureBuilder(
          future: cloudFireStoreNotifier.getQuestion(documentId),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {

              return Center(
                child: CircularProgressIndicator(
                  color: ColorSharedPreferenceService().getColor(),
                ),
              );

            }
            else if (snapshot.hasData) {

              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: PastQuestionDetailWidget(snapshot.data!,documentId),
                  ),
                ),
              );
            }

            else {
              throw Exception(getFirebaseError);
            }
          },

        ),
        floatingActionButton: BasicButtonWidget(
          title: 'SNSで共有する',
          width: MediaQuery.of(context).size.width - 50.w,
          action: () {
            shareText(context, """「$questionName」であなたの知識を試してみませんか？🌟
            🔑パスワード:「$documentId」
        
            この問題集は、[$author]によって作られました。私たちのアプリは、教員や塾講師がテストや試験対策のために独自の問題集を作成し、生徒たちに挑戦させることができるプラットフォームです。授業や自習の質を高め、学習効果を最大化しましょう。
        
            生徒の理解度を深め、より効果的な学習経験を提供するために設計されています。あなたも今すぐこのツールを使って、教育の可能性を広げてみてください！
        
            👉ダウンロードはこちら: [アプリのURL]
                """);
          },),
      ),
    );
  }
}










