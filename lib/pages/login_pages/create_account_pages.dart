import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../gen/assets.gen.dart';
import '../../notifier/login_notifier/login_notifier.dart';
import '../../util/snackbar.dart';
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
                     cursorColor: (isPassValid.value) ? baseColor : Colors.red,
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
                       RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,12}$');
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

                       if (user?.errorCode != null && context.mounted) {
                         displayErrorSnackBar(
                             ref, context, user!.errorCode!.message);
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
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const LoginPage()),
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
     }
    );
  }
}
