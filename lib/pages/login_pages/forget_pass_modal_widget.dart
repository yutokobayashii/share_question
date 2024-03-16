import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/util/snackbar.dart';

import '../../constant/color.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../dialog/send_confirm_mail_dialog.dart';
import '../../gen/assets.gen.dart';
import '../../notifier/login_notifier/login_notifier.dart';

class ForgetPassModalWidget extends HookConsumerWidget {
  const ForgetPassModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = useState("");

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 80.w,
            height: 70.h,
            child: TextField(
              cursorColor: ColorSharedPreferenceService().getColor(),
              decoration: InputDecoration(
                hintText: 'メールアドレス',
                prefixIcon: const Icon(Icons.person_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorSharedPreferenceService().getColor()),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorSharedPreferenceService()
                          .getColor()), // フォーカス時の枠線色
                ),
                filled: true,
                fillColor: Colors.white, // 背景色を設定
              ),
              onChanged: (text) {
                mail.value = text;
              },
              onSubmitted: (text) {},
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () async {
              final isSuccess = await ref
                  .read(loginNotifierProvider.notifier)
                  .sendResetPassWordMail(mail.value);

              if (context.mounted) {
                if (isSuccess) {
                  showSendConfirmMailDialog(context);
                } else {
                  displayErrorSnackBar(
                      ref, context, "予期せぬエラーが発生しました。\n再度時間をおいてお試しください");
                }
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 80.w,
              height: 55.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: baseColor,
                border: Border.all(
                  color: baseColor,
                  width: 1,
                ),
              ),
              child: Center(
                  child: Text(
                '確認メールを送る',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.white),
              )),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              width: 170.w,
              height: 170.h,
              child: Image.asset(Assets.images.screen.path)),
        ],
      ),
    );
  }
}
