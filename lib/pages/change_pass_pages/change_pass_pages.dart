import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/data/local/color_shared_preference_service.dart';
import 'package:share_question/util/snackbar.dart';

import '../../constant/color.dart';
import '../../dialog/success_change_pass_dialog.dart';
import '../../gen/assets.gen.dart';
import '../../notifier/login_notifier/login_notifier.dart';
import '../../notifier/user/user_notifier.dart';
import '../login_pages/forget_pass_modal_widget.dart';

class ChangePassPages extends HookConsumerWidget {
  const ChangePassPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPass = useState("");
    final newPass = useState("");
    final isNewPassValid = useState(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: const Text("パスワード変更"),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text('現在のパスワード',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: ColorSharedPreferenceService().getColor())),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: SizedBox(
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
                        borderSide: BorderSide(color: baseColor),
                      ),
                      filled: true,
                      fillColor: Colors.white, // 背景色を設定
                    ),
                    onChanged: (text) {
                      currentPass.value = text;
                    },
                    onSubmitted: (text) {},
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text('新しいパスワード',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: ColorSharedPreferenceService().getColor())),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80.w,
                height: 70.h,
                child: TextField(
                  cursorColor: (isNewPassValid.value) ? baseColor : Colors.red,
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: baseColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              (isNewPassValid.value) ? baseColor : Colors.red),
                    ),
                    filled: true,
                    fillColor: Colors.white, // 背景色を設定
                  ),
                  onChanged: (text) {
                    RegExp regex =
                        RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$');
                    if (regex.hasMatch(text)) {
                      isNewPassValid.value = true;
                    } else {
                      isNewPassValid.value = false;
                    }
                    newPass.value = text;
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
                  final user = await ref
                      .read(loginNotifierProvider.notifier)
                      .getCurrentUser();

                  if (!isNewPassValid.value && context.mounted) {
                    displayErrorSnackBar(
                        ref, context, "パスワードは英数文字、8文字以上１２文字以下で設定してください。");
                  } else if (user != null && isNewPassValid.value) {
                    final isCurrentPassValid = await ref
                        .read(userNotifierProvider.notifier)
                        .reAuthenticate(user, currentPass.value);

                    if (isCurrentPassValid) {
                      await ref
                          .read(userNotifierProvider.notifier)
                          .renewPassword(user, newPass.value);

                      if (context.mounted) {
                        showSuccessChangePassDialog(context);
                      }
                    } else {
                      if (context.mounted) {
                        displayErrorSnackBar(ref, context, "現在のパスワードが正しくありません");
                      }
                    }
                  } else {
                    if (context.mounted) {
                      displayErrorSnackBar(
                          ref, context, "予期せぬエラーが発生しました。\n時間をおいて再度お試しください。");
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
                    'パスワードを変更する',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 15.h,
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
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: Image.asset(Assets.images.screen.path)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
