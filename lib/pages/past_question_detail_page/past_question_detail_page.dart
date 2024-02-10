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
  const PastQuestionDetailPage(this.token, {
    super.key
  });

  final String token;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cloudFireStoreNotifier = ref.watch(cloudFireStoreNotifierProvider.notifier);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('問題集名')),
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
        body: FutureBuilder(
          future: cloudFireStoreNotifier.getQuestion(token),
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
                    child: PastQuestionDetailWidget(snapshot.data!,token),
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
            shareText(context, "kkkkkkkkkkkkkkkkkkk");
          },),
      ),
    );
  }
}










