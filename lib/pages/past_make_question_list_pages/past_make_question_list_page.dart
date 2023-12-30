


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/pages/past_make_question_list_pages/past_question_detail_page.dart';

import '../../constant/color_constant.dart';

class PastMakeQuestionListPage extends StatelessWidget {
  const PastMakeQuestionListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h,),
            
                for(int i = 0; i<3; i++)... {
                  const PastQuestionListWidget(),
                  SizedBox(height: 20.h,),
            
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PastQuestionListWidget extends StatelessWidget {
  const PastQuestionListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PastQuestionDetailPage()),
        );

      },
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
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 15.h,),

              Text('問題名:',
                  style: colorBoldTextStyle),

              Text("dddddddddddd",
                style: boldTextStyle,),

              SizedBox(height: 15.h,),

              Row(
                children: [
                  Text('作成者:',
                      style: colorBoldTextStyle),

                  SizedBox(width: 5.w,),

                  Text("小林優斗",
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),



              Row(
                children: [
                  Text('作成日:',
                      style: colorBoldTextStyle),

                  SizedBox(width: 5.w,),

                  Text("2023/04/24",
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('説明:',
                      style: colorBoldTextStyle),

                  SizedBox(width: 5.w,),

                  Text("あああああああああああああああああああああああああああああああああああああ",
                    style: boldTextStyle,),
                ],
              ),

              SizedBox(height: 15.h,),


            ],
          ),
        ),

      ),
    );
  }
}
