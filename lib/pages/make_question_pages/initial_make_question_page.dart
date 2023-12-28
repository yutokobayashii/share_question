
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/constant/color_constant.dart';

import '../../widgets/base_textfield_widget.dart';
import '../../widgets/dialog_widget.dart';
import 'make_question_page.dart';

class InitialMakeQuestionPage extends StatelessWidget {
  const InitialMakeQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
    builder: (_ , child) {
     return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
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
                    },

                  ),
                );
              },
                child: const Icon(
                  Icons.arrow_back,
                  size: 28,
                )
               ),
            title: const Text('作問'),
            actions: [
              GestureDetector(
                onTap: () {

                  showDialog(
                    context: context,
                    builder: (BuildContext context1) => AlertDialogWidget(
                      title: 'ここまでの作問を保存しますか？',
                      content: '保存した作問は後から再開できます',
                      leftText: '作問を続ける',
                      rightText: '保存する',
                      rightAction: () {
                        debugPrint('保存しました');
                        Navigator.pop(context1);
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      leftAction: () {
                        Navigator.pop(context1);
                      },
                    )
                  );

                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.description_outlined,
                    size: 28,
                  ),
                ),
              )
            ],

          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 15.h,),
                   const BaseTextFieldWidget(
                    title: '問題集名',
                    maxLength: 30,
                    rightWidget: IsRequiredWidget()
                  ),

                  SizedBox(height: 10.h,),
                  const BaseTextFieldWidget(
                    title: '作成者名',
                    maxLength: 15,
                    rightWidget: IsRequiredWidget()
                  ),

                  SizedBox(height: 10.h,),
                  const BaseTextFieldWidget(
                    title: '問題集の説明',
                    maxLength: 100,),

                  SizedBox(height: 10.h,),
                  const BaseTextFieldWidget(
                    title: '解答した人へのコメント',
                    maxLength: 100,),
                ],
              ),
            ),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OptionMakeQuestionPage()),
              );

            },
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: baseColor,
              ),
              child: Center(child:
              Text(
                '次へ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700
                ),)),
            ),
          )
        ),
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
        height: 16.h,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            '必須',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      );
  }
}


