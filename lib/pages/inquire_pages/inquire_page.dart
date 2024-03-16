
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/data/local/color_shared_preference_service.dart';
import 'package:share_question/entity/inquire/inquire.dart';
import 'package:share_question/notifier/login_notifier/login_notifier.dart';

import '../../notifier/inquire/inquire_notifier.dart';

class InquirePage extends HookConsumerWidget {
  const InquirePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final inquireText = useState("");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          title: const Text("お問い合わせ"),
        ),
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'いつもアプリをご利用いただき\nありがとうございます。\nアプリに対するご不満やご要望などがあれば\nお気軽にお問い合わせください。',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'お問い合わせ内容',
                    alignLabelWithHint: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorSharedPreferenceService().getColor(),
                        width: 2.0, // フォーカス時の枠線の太さ
                      ),
                    ),
                  ),
                  cursorColor: ColorSharedPreferenceService().getColor(),
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  onChanged: (text) {
                    inquireText.value = text;
                  },
                ),
              ),

              SizedBox(height: 20.h,),

              const Text('※なおこのフォームは送信専用であり、\n返信は行なっておりませんが、\n今後のアプリの性能向上の参考にさせていただきます。',
                style: TextStyle(
                  color: Colors.black45
                ),),

              SizedBox(
                height: 50.h,
              ),

              GestureDetector(
                onTap: () async {
                  final user =  await ref.read(loginNotifierProvider.notifier).getCurrentUser();
                  final data = Inquire(userId: user?.uid ?? "", content: inquireText.value);
                  final mapData = data.toJson();
                  ref.read(inquireNotifierProvider.notifier).sendInquire(mapData);
                },
                child: Container(
                  width: 200.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorSharedPreferenceService().getColor(),
                  ),
                  child: Center(child: Text('送信',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp
                    ),)),

                ),
              )
            ],
          ),
        ));
  }
}
