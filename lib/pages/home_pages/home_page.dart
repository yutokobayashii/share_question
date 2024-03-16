import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/pages/calendar_page/calendar_page.dart';
import 'package:share_question/pages/home_pages/home_widgets/small_main_home_widget.dart';
import 'package:share_question/pages/past_make_question_list_pages/past_make_question_list_page.dart';

import '../../dialog/alart_dialog.dart';
import '../../gen/assets.gen.dart';
import '../../notifier/question_number/question_number_notifier.dart';
import '../guide_pages/guide_widget/select_guide_widget.dart';
import '../make_question_pages/make_question_widgets/initial_make_question_page.dart';
import 'home_widgets/main_home_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          final width = MediaQuery.of(context).size.width - 80.w;
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: const Text("ホーム"),
                ),
                body: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: MainHomeWidget(
                            width: width,
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                            title: '問題を作成する',
                            content: '問題を作成してみんなに問題を共有しよう',
                            action: () {
                              final questionNumber =
                                  ref.read(questionNumberNotifierProvider.notifier)
                                      .getQuestionNumber();

                              if (questionNumber > 3) {
                                showCupertinoDialog(
                                    context: context,
                                    title: '無料会員で3問以上の作問はできません。',
                                    content: '有料会員になるか既存の問題を削除してください。',
                                    cancelText: '戻る',
                                    okText: '有料会員へ',
                                    onCancel: () {},
                                    onOK: () {});
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InitialMakeQuestionPage()),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallMainHomeWidget(
                              width: width,
                              icon: const Icon(Icons.sort),
                              title: '過去の作問集',
                              action: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PastMakeQuestionListPage()),
                                );
                              },
                              angle: -pi / 2,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            SmallMainHomeWidget(
                              width: width,
                              icon: const Icon(Icons.calendar_month_outlined),
                              title: '解答実績',
                              action: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CalendarPage()),
                                );
                              },
                              angle: -pi * 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        MainHomeWidget(
                          width: width,
                          icon: const Icon(
                            Icons.lightbulb_outline,
                            size: 30,
                          ),
                          title: '使い方ガイド',
                          content:
                              'lineや各種SNSで作った問題をみんなに共有し、\n学校の授業、部活動、家族や会社で活用しよう！',
                          action: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
                              builder: (BuildContext context) {
                                return Container(
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: MediaQuery.of(context).size.width,
                                    child: const SelectGuideWidget());
                              },
                            );
                          },
                        ),
                        SizedBox(
                            width: 260.w,
                            height: 260.h,
                            child: Image.asset(Assets.images.screen.path))
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
