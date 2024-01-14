

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/controller/share_controller.dart';
import 'package:share_question/pages/past_make_question_list_pages/widget/past_question_detail_list_widget.dart';
import 'package:share_question/widgets/basic_button_widget.dart';

import '../../../provider/shared_prefrence_provider.dart';
import '../../../widgets/copy_text_icon.dart';

class PastQuestionDetailPage extends HookConsumerWidget {
  const PastQuestionDetailPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 50.h,),

                  Text('この問題のパスワード',
                  style: boldTextStyle,),

                  SizedBox(height: 15.h,),

                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: IntrinsicWidth(
                      child: Row(
                        children: [
                          const CopyTextIcon(textToCopy: 'ukdhgumbckdhio'),

                           Text('ukdhgumbckdhio', style: normalTextStyle,),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h,),

                  Text('追加された回数:5回',
                    style: boldTextStyle,),

                  SizedBox(height: 15.h,),

                  Text('解答された回数:5回',
                    style: boldTextStyle,),

                  SizedBox(height: 15.h,),

                  Row(
                    children: [
                      Icon(Icons.star,color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),),
                      SizedBox(width: 5.w,),
                      Text('いいね数:5',
                        style: boldTextStyle,),
                    ],
                  ),

                  SizedBox(height: 50.h,),

                  Text('問題集名',
                    style: boldTextStyle,),

                  SizedBox(height: 5.h,),

                  Text('問題集名問題集名問題集名問題集名問題集名問題集名問題集名問題集名問題集名問題集名',
                    style: normalTextStyle,),

                  SizedBox(height: 25.h,),

                  Text('作成者名',
                    style: boldTextStyle,),

                  SizedBox(height: 5.h,),

                  Text('作成者名作成者名作成者名作成者名作成者名作成者名作成者名作成者名作成者名作成者名',
                    style: normalTextStyle,),


                  SizedBox(height: 25.h,),

                  Row(
                    children: [
                      Text('作成日:',
                        style: boldTextStyle,),

                      SizedBox(width: 15.w,),

                      Text('2023/04/18',
                        style: boldTextStyle,),

                    ],
                  ),



                  SizedBox(height: 25.h,),

                  Text('問題集の説明',
                    style: boldTextStyle,),

                  SizedBox(height: 5.h,),

                  Text('問題集の説明問題集の説明問題集の説明問題集の説明問題集の説明問題集の説明問題集の説明問題集の説明問題集の説明問題集の説明',
                    style: normalTextStyle,),

                  SizedBox(height: 25.h,),

                  Text('解答した人へのコメント',
                    style: boldTextStyle,),

                  SizedBox(height: 5.h,),

                  Text('解答した人へのコメント解答した人へのコメント解答した人へのコメント解答した人へのコメント解答した人へのコメント解答した人へのコメント解答した人へのコメント解答した人へのコメント',
                    style: normalTextStyle,),

                  SizedBox(height: 50.h,),


                  for(int i = 0; i<3; i++) ...{
                    const PastQuestionDetailListWidget(isOptional: true, isImage: true,),
                    const SizedBox(height: 20,),
                  },


                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
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








