import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../dialog/success_login_dialog.dart';
import '../../entity/user_info/user_info.dart';
import '../../gen/assets.gen.dart';
import '../../notifier/login_notifier/login_notifier.dart';
import '../../notifier/mail/mail_notifier.dart';

import '../../notifier/user_info/user_info_notifier.dart';
import '../../util/snackbar.dart';
import '../base_page.dart';
import 'forget_pass_modal_widget.dart';
import 'login_page.dart';

class CreateAccountPages extends HookConsumerWidget {
  const CreateAccountPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = useState("");
    final passWord = useState("");
    final isPassValid = useState(false);
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (_, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                        width: 180.w,
                        height: 180.h,
                        child: Image.asset(Assets.images.screen.path)),
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
                                color:
                                    ColorSharedPreferenceService().getColor()),
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
                      height: 15.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80.w,
                      height: 70.h,
                      child: TextField(
                        cursorColor:
                            (isPassValid.value) ? baseColor : Colors.red,
                        decoration: InputDecoration(
                          hintText: 'パスワード',
                          prefixIcon: const Icon(Icons.lock_outlined),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: baseColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: (isPassValid.value)
                                    ? baseColor
                                    : Colors.red), // フォーカス時の枠線色
                          ),
                          filled: true,
                          fillColor: Colors.white, // 背景色を設定
                        ),
                        onChanged: (text) {
                          RegExp regex = RegExp(
                              r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$');
                          if (regex.hasMatch(text)) {
                            isPassValid.value = true;
                          } else {
                            isPassValid.value = false;
                          }
                          passWord.value = text;
                        },
                        onSubmitted: (text) {},
                      ),
                    ),
                    Text(
                      '※英数文字、8文字以上12文字以下で設定してください。',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.black38),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!isPassValid.value) {
                          displayErrorSnackBar(
                              ref, context, "パスワードは英数８文字以上12文字以下で入力してください");
                        } else {
                          final user = await ref
                              .read(loginNotifierProvider.notifier)
                              .createAccount(passWord.value, mail.value);

                          await ref
                              .read(mailNotifierProvider.notifier)
                              .setMail(user?.userCredential?.user?.email ?? "");

                          final data = UserInfo(
                              userId: user?.userCredential?.user?.uid ?? "",
                              mail: user?.userCredential?.user?.email ?? "");
                          final mapData = data.toJson();

                          await ref
                              .read(userInfoNotifierProvider.notifier)
                              .sendUserInfo(mapData);

                          if (context.mounted) {
                            if (user?.errorCode != null) {
                              displayErrorSnackBar(
                                  ref, context, user!.errorCode!.message);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BasePage()),
                              );
                              showSuccessLoginDialog(context);
                            }
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
                          '新規ユーザー登録',
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
                    Text(
                      'OR',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final user = await ref
                            .read(loginNotifierProvider.notifier)
                            .signInWithGoogle();

                        await ref
                            .read(mailNotifierProvider.notifier)
                            .setMail(user?.user?.email ?? "");

                        //ログイン成功
                        if (user != null && context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BasePage()),
                          );

                          showSuccessLoginDialog(context);
                        } else {
                          //ログイン失敗
                          if (context.mounted) {
                            displayErrorSnackBar(ref, context,
                                "googleログインに失敗しました。\n時間をおいて再度お試しください。");
                          }
                        }
                      },
                      child: Image.asset(
                        Assets.images.google.path,
                        width: MediaQuery.of(context).size.width - 180.w,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'すでにアカウントをお持ちの方',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: Text(
                            'ログイン',
                            style: TextStyle(
                                color: baseColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'パスワードを忘れた方は',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            //ここでメールアドレス
                            showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                isDismissible: true,
                                builder: (BuildContext context) {
                                  return const ForgetPassModalWidget();
                                });
                          },
                          child: Text(
                            'こちら',
                            style: TextStyle(
                                color: baseColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
