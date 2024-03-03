
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/data/local/token_isar_dao.dart';
import 'package:share_question/pages/past_make_question_list_pages/widget/past_question_list_widget.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../guide_pages/guide_widget/select_guide_widget.dart';

class PastMakeQuestionListPage extends HookConsumerWidget {
  const PastMakeQuestionListPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('過去の作問一覧')),
          centerTitle:true,
          leading:
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, size: 28,)),


          actions: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
                  builder: (BuildContext context) {
                    return Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: const SelectGuideWidget());
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.lightbulb_outline,size: 28,),
              ),
            )
          ],
        ),
        body: FutureBuilder(
          future: TokenDao.tokenFindAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return CircularProgressIndicator(
                color: ColorSharedPreferenceService().getColor(),
              );

            }
            else if (snapshot.data!.isEmpty) {

             return const Center(child:
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text('まだ作問実績がありません。',style: TextStyle(color: Colors.grey),),
                 Text('作問画面から問題を作成しましょう',style: TextStyle(color: Colors.grey),)
               ],
             ));

            }
            else if (snapshot.hasError) {
              // エラーが発生した場合はエラーメッセージを表示
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else if (snapshot.hasData) {
              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h,),

                      for(int i = 0; i<snapshot.data!.length; i++)... {
                         PastQuestionListWidget(list: snapshot.data!, i: i,),
                        SizedBox(height: 20.h,),

                      }
                    ],
                  ),
                ),
              );
            }
            else {
              // その他の状態
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}


