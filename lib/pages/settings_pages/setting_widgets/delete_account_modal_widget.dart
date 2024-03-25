import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/util/snackbar.dart';

import '../../../data/local/color_shared_preference_service.dart';
import '../../../gen/assets.gen.dart';
import '../../../notifier/login_notifier/login_notifier.dart';
import '../../../notifier/user/user_notifier.dart';
import '../../login_pages/create_account_pages.dart';
import '../../route_page/route_page.dart';


class DeleteAccountModalWidget extends HookConsumerWidget {
  const DeleteAccountModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passWord = useState("");

    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.6,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width - 80.w,
            height: 70.h,
            child: TextField(
              cursorColor: ColorSharedPreferenceService().getColor(),
              decoration: InputDecoration(
                hintText: 'パスワード',
                prefixIcon: const Icon(Icons.person_outlined),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorSharedPreferenceService().getColor()),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorSharedPreferenceService()
                          .getColor()),
                ),
                filled: true,
                fillColor: Colors.white, // 背景色を設定
              ),
              onChanged: (text) {
                passWord.value = text;
              },
              onSubmitted: (text) {},
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () async {
              //ユーザー認証
              final user = await ref
                  .read(loginNotifierProvider.notifier)
                  .getCurrentUser();

              //再度ログイン
              final isCurrentPassValid = await ref
                  .read(userNotifierProvider.notifier)
                  .reAuthenticate(user!, passWord.value);

              if (!isCurrentPassValid && context.mounted) {
                displayErrorSnackBar(ref, context, "パスワードが正しくありません");
              }

              final isSuccess = await ref
                  .read(userNotifierProvider.notifier)
                  .deleteAccount(user);

              if (isSuccess) {
                navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                      const CreateAccountPages()),
                      (Route<dynamic> _) => false,
                );
              } else {
                if (context.mounted) {
                  displayErrorSnackBar(ref, context,
                      "予期せぬエラーが発生しました。\n時間をおいて再度お試し下さい。");
                }
              }
            },
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 80.w,
              height: 55.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              child: Center(
                  child: Text(
                    'アカウントを削除',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.red),
                  )),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '※アカウントを削除しても、\n自動更新されるサブスクリプションは解約されません。\nサブスクリプションを解約したい場合は、\nApp StoreまたはGoogle Playストアのアカウント設定から手続きを行ってください。',
              style:TextStyle(
                fontSize: 12.sp,
                color: Colors.black38
              ),),
          ),

          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              width: 150.w,
              height: 150.h,
              child: Image.asset(Assets.images.screen.path)),
        ],
      ),
    );
  }
}
