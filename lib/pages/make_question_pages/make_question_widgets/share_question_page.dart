
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/widgets/copy_text_icon.dart';

import '../../../constant/style.dart';
import '../../../controller/share_controller.dart';
import '../../../widgets/basic_button_widget.dart';

class ShareQuestionPage extends StatelessWidget {
  const ShareQuestionPage({
    super.key,
    required this.id,
    required this.author,
    required this.questionName
  });

  final String id;
  final String author;
  final String questionName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);

              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              )
          ),
          title: const Text('共有'),

        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Center(
                child: SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset("assets/images/screen.png")
               ),
              ),
              SizedBox(height: 15.h,),

              Text('作問お疲れ様でした！',
                style: boldTextStyle,
              ),

              SizedBox(height: 15.h,),

              Text('この問題集のパスワードは以下です。',
                style: boldTextStyle,
              ),

              SizedBox(height: 10.h,),

              Container(
                width: MediaQuery.of(context).size.width - 90.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CopyTextIcon(textToCopy: id,),
                    Text(id,
                      style: normalTextStyle,),
                  ],
                ),
              ),

              SizedBox(height: 15.h,),

              SizedBox(
                width: MediaQuery.of(context).size.width - 80.w,
                child: Text('※このパスワードを共有することで、\n解答者はこの問題にアクセスすることが可能になります。',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87
                  ),
                ),
              ),

              SizedBox(height: 10.h,),

              SizedBox(
                width: MediaQuery.of(context).size.width - 80.w,
                child: Text('※このパスワードは、ホーム画面の「過去の作問」からいつでもアクセスできます。',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87
                  ),
                ),
              ),

              SizedBox(height: 25.h,),

              BasicButtonWidget(
                title: 'SNSでシェアする',
                width: MediaQuery.of(context).size.width -80.w,
                action: () {
                  shareText(context,"""「$questionName」であなたの知識を試してみませんか？🌟
            🔑パスワード:「$id」

            この問題集は、[$author]によって作られました。私たちのアプリは、教員や塾講師がテストや試験対策のために独自の問題集を作成し、生徒たちに挑戦させることができるプラットフォームです。授業や自習の質を高め、学習効果を最大化しましょう。

            生徒の理解度を深め、より効果的な学習経験を提供するために設計されています。あなたも今すぐこのツールを使って、教育の可能性を広げてみてください！

            👉ダウンロードはこちら: [アプリのURL]
                """);
                },
              ),

            ],
          ),
        )
      ),
    );
  }
}
