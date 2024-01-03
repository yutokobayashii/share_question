


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/model/question_model/question.dart';
import 'package:share_question/provider/make_question_provider.dart';

import '../../controller/make_question_controller/make_question_controller.dart';
import '../../provider/shared_prefrence_provider.dart';
import '../../widgets/base_textfield_widget.dart';
import '../../widgets/basic_button_widget.dart';
import '../../widgets/dialog_widget.dart';
import 'make_question_widgets/confirm_question_page.dart';
import 'make_question_widgets/option_make_question_page.dart';

final imageFileProvider = StateProvider<XFile?>((ref) => null);

class OptionMakeQuestionPage extends HookConsumerWidget {
  const OptionMakeQuestionPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isOptionAnswerTypeState = useState(false);
    final questionNumber = useState(1);
    final controller = OptionMakeQuestionController();

     QuestionDetail? temList;


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
                  size: 28,
                )
            ),
            title: Center(child: Text('${questionNumber.value}問目')),
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
              ),
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
                    size: 28,
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
                                onTap: isOptionAnswerTypeState.value ? null : () {
                                  isOptionAnswerTypeState.value = true;
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
                                      child: isOptionAnswerTypeState.value ? Center(
                                        child: Container(
                                          width: 12.5.w,
                                          height: 12.5.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
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
                                onTap: isOptionAnswerTypeState.value ? () {
                                  isOptionAnswerTypeState.value = false;
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
                                      child: isOptionAnswerTypeState.value ? null : Center(
                                        child: Container(
                                          width: 12.5.w,
                                          height: 12.5.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
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
                          maxLength: 100,
                          height: 70.h,
                          onChanged: (text) {
                            ref.watch(MakeQuestionProvider.questionProvider.notifier).update((state) => text);
                          },
                          onSubmitted: (text) {

                          },
                        ),

                        BasicAddWidget(
                          text: '画像を追加',
                          icon: Icons.add,
                          action: () {
                            pickImage(ImageSource.gallery,ref);
                          },),

                        (ref.watch(imageFileProvider) != null) ?
                            Column(
                              children: [
                                SizedBox(height: 20.h,),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    color: Colors.white,
                                    width:  250.w,
                                    height: 200.h,
                                    child: Stack(
                                      children: [
                                        Image.file(File(ref.watch(imageFileProvider)!.path),
                                          fit: BoxFit.contain,),

                                        Positioned(
                                          top: 0, // Containerの外側に配置
                                          right: 0, // Containerの外側に配置
                                          child:  GestureDetector(
                                            onTap: () {
                                              ref.watch(imageFileProvider.notifier).update((state) => null);
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                                                )
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                            : const SizedBox(),


                        (isOptionAnswerTypeState.value)
                            ? const OptionMakeQuestionWidget() :
                          SizedBox(height: 15.h,),



                        BaseTextFieldWidget(
                          title: '正解',
                          maxLength: 30,
                          height: 70.h,
                          onChanged: (text) {
                            ref.watch(MakeQuestionProvider.correctProvider.notifier).update((state) => text);
                          },
                          onSubmitted: (text) {

                        },
                        ),

                        BaseTextFieldWidget(
                          title: '解説',
                          maxLength: 30,
                          height: 70.h,
                          onChanged: (text) {
                            ref.watch(MakeQuestionProvider.commentProvider.notifier).update((state) => text);
                          },
                          onSubmitted: (text) {

                         },
                        ),

                        SizedBox(height: 20.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BasicButtonWidget(
                              title: '最終確認へ',
                              width: MediaQuery.of(context).size.width  /2 -35.w,
                              action: () {
                                questionNumber.value = 1;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ConfirmQuestionPage()),
                                );

                              },
                            ),
                            SizedBox(width: 20.w,),

                            BasicButtonWidget(
                              title: '${questionNumber.value + 1}問目へ',
                              width: MediaQuery.of(context).size.width  /2 -35.w,
                              action: () {
                                questionNumber.value ++;

                                temList = QuestionDetail(
                                    isOptional: isOptionAnswerTypeState.value,
                                    questionName: ref.watch(MakeQuestionProvider.questionProvider),
                                    image: ref.watch(MakeQuestionProvider.imageProvider),
                                    correctAnswer: ref.watch(MakeQuestionProvider.correctProvider),
                                    explanation: ref.watch(MakeQuestionProvider.commentProvider),
                                    optionalList: (isOptionAnswerTypeState.value) ?
                                    [
                                      for(int i = 0; i<ref.watch(MakeQuestionProvider.optionalNumber); i++) ...{
                                        OptionalQuestion(optional: ref.watch(MakeQuestionProvider.optionalProvider(i+1)))
                                      }
                                    ]
                                     : []
                                );
                                
                                ref.watch(MakeQuestionProvider.questionDetailListProvider).add(temList!);

                                ref.watch(MakeQuestionProvider.questionDetailListProvider.notifier).update((state) => ref.watch(MakeQuestionProvider.questionDetailListProvider));

                                controller.clearControllers();

                                isOptionAnswerTypeState.value = false;



                              },
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





