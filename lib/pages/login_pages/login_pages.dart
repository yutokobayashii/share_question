import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../gen/assets.gen.dart';
import '../../notifier/login_notifier/login_notifier.dart';

class LoginPages extends HookConsumerWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = useState("");
    final passWord = useState("");
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                  width: 200.w,
                  height: 200.h,
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
                height: 15.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80.w,
                height: 70.h,
                child: TextField(
                  cursorColor: baseColor,
                  decoration: const InputDecoration(
                    hintText: 'パスワード',
                    prefixIcon: Icon(Icons.lock_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: baseColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: baseColor), // フォーカス時の枠線色
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
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {},
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
                      child: GestureDetector(
                    onTap: () async {
                      await ref
                          .read(loginNotifierProvider.notifier)
                          .createAccount(passWord.value, mail.value);
                    },
                    child: Text(
                      '新規ユーザー登録',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () async {
                  await ref
                      .read(loginNotifierProvider.notifier)
                      .signInWithGoogle();
                },
                child: Image.asset(
                  Assets.images.google.path,
                  width: MediaQuery.of(context).size.width - 180.w,
                ),
              ),
              SizedBox(
                height: 30.h,
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
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                     await ref.read(loginNotifierProvider.notifier).login(mail.value, passWord.value);
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
                height: 30.h,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
