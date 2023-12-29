
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/pages/home_pages/home_widgets/small_main_home_widget.dart';

import '../../model/tabbar_model/tab_item_data.dart';
import '../make_question_pages/make_question_widgets/initial_make_question_page.dart';
import 'home_widgets/main_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.home.title;
    return ScreenUtilInit(
      designSize: const Size(393, 852),
    builder: (_ , child) {
      final width = MediaQuery.of(context).size.width - 80.w;
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(pageTitle),
               actions: const [
                 Padding(
                   padding: EdgeInsets.only(right: 20),
                   child: Icon(Icons.lightbulb_outline,size: 28,),
                 )
               ],
              ),
              body: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Column(
                                //    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: MainHomeWidget(
                          width: width,
                          icon: const Icon(Icons.add,size: 30,),
                          title: '問題を作成する',
                          content: '問題を作成してみんなに問題を共有しよう',
                          action: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const InitialMakeQuestionPage()),
                            );

                          },
                        ),
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallMainHomeWidget(
                            width: width,
                            icon: const Icon(Icons.sort),
                            title: '過去の作問集',
                            action: () {
                              debugPrint('あああああ');
                            }, angle: -pi / 2,
                          ),
                          SizedBox(width: 20.w,),
                          SmallMainHomeWidget(
                            width: width,
                            icon: const Icon(Icons.description_outlined),
                            title: '下書き一覧',
                            action: () {
                              debugPrint('かかかかか');
                            }, angle: pi,
                          ),
                        ],
                      ),

                      SizedBox(height: 30.h,),

                      MainHomeWidget(
                        width: width,
                        icon: const Icon(Icons.lightbulb_outline,size: 30,),
                        title: '使い方ガイド',
                        content: 'lineや各種SNSで作った問題をみんなに共有し、\n学校の授業、部活動、家族や会社で活用しよう！',
                        action: () {
                          debugPrint('ええええええええ');
                        },
                      ),
                    ],
                  ),
                ),
              )
          ),
        );
    }

    );
  }
}



