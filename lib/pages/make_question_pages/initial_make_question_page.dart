
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/constant/color_constant.dart';

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
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
                child: const Icon(
                  Icons.arrow_back,
                  size: 25,
                )
               ),
            title: const Text('作問'),

          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                const BaseTextFieldWidget(
                  title: '問題集名',
                  isRequired: true,
                  maxLength: 30,),

                SizedBox(height: 10.h,),
                const BaseTextFieldWidget(
                  title: '作成者名',
                  isRequired: true,
                  maxLength: 15,),

                SizedBox(height: 10.h,),
                const BaseTextFieldWidget(
                  title: '問題集の説明',
                  isRequired: false,
                  maxLength: 100,),

                SizedBox(height: 10.h,),
                const BaseTextFieldWidget(
                  title: '解答した人へのコメント',
                  isRequired: false,
                  maxLength: 100,),
              ],
            ),
          ),
          floatingActionButton: Container(
            height: 70.0, // 高さ
            width: 70.0, // 幅
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // 円形に設定
              color: baseColor, // 背景色
            ),
            child: Center(child:
            Text(
              '次へ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700
              ),)),
          )
        ),
      );
    });
  }
}

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget({
    super.key,
    required this.title,
    required this.isRequired,
    required this.maxLength,
  });

  final String title;
  final bool isRequired;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            SizedBox(width: 5.w,),
            isRequired ?
            Container(
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
                  ),),
              ),
            )
                :
            const SizedBox()
          ],
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          width: MediaQuery.of(context).size.width - 50.w,
          height: 80.h,
          child: TextField(
            maxLength: maxLength,
            cursorColor: baseColor,
            controller: TextEditingController(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: baseColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: baseColor), // フォーカス時の外枠の色
              ),
           ),
          ),
        )
      ],
    );
  }
}
