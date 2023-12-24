
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/constant/color_constant.dart';

import '../../widgets/base_textfield_widget.dart';
import '../../widgets/dialog_widget.dart';
import 'option_make_question_page.dart';

class OptionMakeQuestionPage extends HookWidget {
  const OptionMakeQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isOptionAnswerTypeProvider = useState(false);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
    builder: (_ , child) {
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
                  size: 25,
                )
            ),
            title: const Text('N問目'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
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
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
        
                      ),
                    );
                  },
                  child: const Icon(Icons.close,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              )
            ],
        
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers:  [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        SizedBox(height: 15.h,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "解答方法",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 10,),
                            GestureDetector(
                                onTap: isOptionAnswerTypeProvider.value ? null : () {
                                  isOptionAnswerTypeProvider.value = true;
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: isOptionAnswerTypeProvider.value ? Center(
                                        child: Container(
                                          width: 12.5.w,
                                          height: 12.5.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: baseColor,
                                          ),
                                        ),
                                      ) : null,
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text('選択肢',
                                      style: TextStyle(
                                          fontSize: 16.sp
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 10.h,),
                            GestureDetector(
                                onTap: isOptionAnswerTypeProvider.value ? () {
                                  isOptionAnswerTypeProvider.value = false;
                                } : null,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration:  BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      child: isOptionAnswerTypeProvider.value ? null : Center(
                                        child: Container(
                                          width: 12.5.w,
                                          height: 12.5.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: baseColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text('記入式',
                                      style: TextStyle(
                                          fontSize: 16.sp
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),

                        SizedBox(height: 15.h,),

                        BaseTextFieldWidget(
                          title: '問題',
                          isRequired: false,
                          maxLength: 100,
                          height: 70.h,
                        ),

                        BasicAddWidget(
                          text: '画像を追加',
                          icon: Icons.add,
                          action: () {

                          },),

                        (isOptionAnswerTypeProvider.value)
                            ? const OptionMakeQuestionWidget() :
                        const SizedBox(),

                        SizedBox(height: 15.h,),

                        BaseTextFieldWidget(
                          title: '正解',
                          isRequired: false,
                          maxLength: 30,
                          height: 70.h,
                        ),

                        BaseTextFieldWidget(
                          title: '解説',
                          isRequired: false,
                          maxLength: 30,
                          height: 70.h,
                        ),

                        SizedBox(height: 20.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width  /2 -35.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: baseColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: baseColor, // 外枠の色を黒に
                                  width: 1, // 外枠の太さ
                                ),
                              ),
                              child: Center(child: Text(
                                '最終確認へ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp
                                ),)),
                            ),
                            SizedBox(width: 20.w,),
                            Container(
                              width: MediaQuery.of(context).size.width /2 -35.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color: baseColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: baseColor, // 外枠の色を黒に
                                  width: 1, // 外枠の太さ
                                ),
                              ),
                              child: Center(child: Text(
                                'N問目へ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp
                                ),
                              )),
                            ),
                          ],
                        ),

                        SizedBox(height: 60.h,)

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}



