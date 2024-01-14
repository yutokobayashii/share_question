


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/data/local/isar_dao.dart';
import 'package:share_question/pages/past_make_question_list_pages/widget/past_question_detail_page.dart';
import 'package:share_question/pages/past_make_question_list_pages/widget/past_question_list_widget.dart';

import '../../collection/token.dart';
import '../../constant/color_constant.dart';
import '../../provider/shared_prefrence_provider.dart';

class PastMakeQuestionListPage extends HookConsumerWidget {
  const PastMakeQuestionListPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     List<Token> tokenList = [];

    useEffect(()  {
      void fetchData() async {
        final tokens = await TokenDao.tokenFindAll();
        tokenList = tokens;
        print('sssssss$tokenList');
      }

      fetchData();

      print(tokenList.length);

      for(int i = 0; i<tokenList.length; i++) {

        print(tokenList[i].questionName);
        print('bkccdc');

      }



      return null;
    }, [tokenList]);

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


          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.lightbulb_outline,size: 28,),
            )
          ],
        ),
        body: FutureBuilder(
          future: TokenDao.tokenFindAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return CircularProgressIndicator(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
              );

            }
            else if (snapshot.hasError) {
              // エラーが発生した場合はエラーメッセージを表示
              return Text('Error: ${snapshot.error}');
            }
            else if (snapshot.hasData) {

              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
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


