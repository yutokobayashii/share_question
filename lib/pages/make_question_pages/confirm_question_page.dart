
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/pages/make_question_pages/share_question_page.dart';

import '../../constant/color_constant.dart';
import '../../widgets/dialog_widget.dart';

class ConfirmQuestionPage extends StatelessWidget {
  const ConfirmQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
          title: const Text('最終確認'),
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
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 20.h,),

                for(int i = 0; i<2; i++) ...{

                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Wrap(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${i+1}問目',
                                        style: boldTextStyle
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Row(
                                        children: [
                                          Text('編集する',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),

                                          const Icon(Icons.edit_outlined, color: baseColor,)
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.h,),

                                Text('問題',
                                    style: boldTextStyle
                                ),

                                SizedBox(height: 5.h,),

                                Text('ああああああああああああああああああああああああああああああああああああああああああ',
                                  style: normalTextStyle,
                                ),

                                SizedBox(height: 15.h,),

                                for(int i = 0; i<4; i++) ...{

                                  Text('選択肢${i+1}',
                                      style: boldTextStyle
                                  ),

                                  SizedBox(height: 5.h,),

                                  Text('ああああああああああああああああ',
                                    style: normalTextStyle,
                                  ),

                                  SizedBox(height: 15.h,),

                                },

                                Text('解答',
                                    style: boldTextStyle
                                ),

                                SizedBox(height: 5.h,),

                                Text('ああああああああああああああああああああああああああああああああああああああああああ',
                                  style: normalTextStyle,
                                ),

                                Text('解説',
                                    style: boldTextStyle
                                ),

                                SizedBox(height: 5.h,),

                                Text('ああああああああああああああああああああああああああああああああああああああああああ',
                                  style: normalTextStyle,
                                ),


                                SizedBox(height: 20.h,)
                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 30,),
                },


                SizedBox(height: 100.h,),
              ],

            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShareQuestionPage()),
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
              '共有',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700
              ),)),
          ),
        ),
      ),
    );
  }
}
