
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';
import 'package:share_question/notifier/login_notifier/login_notifier.dart';
import 'package:share_question/notifier/status/status_notifier.dart';
import 'package:share_question/util/snackbar.dart';

import '../../../data/local/color_shared_preference_service.dart';
import '../../../notifier/in_app_purchase/in_app_purchase_notifier.dart';


class ChangeStatusModalWidget extends HookConsumerWidget {
  const ChangeStatusModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    ref.invalidate(statusNotifierProvider);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 35,
                  )),
            ),
          ),
          const Text(
            '有料会員',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.edit,
                size: 40,
                color: ColorSharedPreferenceService().getColor(),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '無制限の問題作成',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '無料会員では、\n3つの問題集まで作成できますが、\n有料会員では無制限に作問できます。',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black45),
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.photo_library,
                size: 40,
                color: ColorSharedPreferenceService().getColor(),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '無制限の画像アップロード',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '無料会員では、\n１つの問題集に5つまで\n画像をアップロードできますが、\n有料会員では無制限に\nアップロードできます。',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black45),
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.flash_on,
                size: 40,
                color: ColorSharedPreferenceService().getColor(),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'その他機能全般',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '無料会員で使用可能な機能に加え、\nさらに今後も有料会員限定機能を\n実装予定です。',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black45),
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () async {

              payedAction() async {
                await ref.read(statusNotifierProvider.notifier).toPayed();
                ref.invalidate(statusNotifierProvider);
               }

              freeAction() async {
               await ref.read(statusNotifierProvider.notifier).toFree();
               ref.invalidate(statusNotifierProvider);
              }

              errorAction() {
                displayErrorSnackBar(ref, context, "予期せぬエラーが発生しました。\n再度時間をおいてお試しください");
              }

              subscriptionDoneAction() {
                displayErrorSnackBar(ref, context, "すでに有料会員に登録されています。");
              }

              successAction() {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('ご購入いただきありがとうございます。'),
                        content: const Text('最大限アプリを活用いただきますと幸いです。'),
                        actions: <Widget>[
                          CupertinoDialogAction(child: const Text("OK",style: TextStyle(color: baseColor),),
                            onPressed: () => Navigator.pop(context),),
                        ],
                      );
                    }
                );
              }

             final user = await ref.read(loginNotifierProvider.notifier).getCurrentUser();

             await ref.read(inAppPurchaseNotifierProvider.notifier).initInAppPurchase(user?.uid ?? "",freeAction,payedAction,subscriptionDoneAction);

             await ref.read(inAppPurchaseNotifierProvider.notifier).makePurchase("default", user?.uid ?? "",freeAction,payedAction,errorAction,successAction);

            },
            child: Container(
                    width: 270.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorSharedPreferenceService().getColor(),
                    ),
                    child: Center(
                        child: Text(
                      '350円/月',
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
          GestureDetector(
            onTap: () async {
             await ref.read(inAppPurchaseNotifierProvider.notifier).restorePurchase(
               "default",
                   () async {
                     await ref.read(statusNotifierProvider.notifier).toFree();
                     ref.invalidate(statusNotifierProvider);
                   },
                   () async {
                     await ref.read(statusNotifierProvider.notifier).toPayed();
                     ref.invalidate(statusNotifierProvider);
                   },
                   () {
                     showDialog(
                         context: context,
                         builder: (context) {
                           return CupertinoAlertDialog(
                             title: const Text('復元に成功しました。'),
                             content: const Text('最大限アプリを活用いただきますと幸いです。'),
                             actions: <Widget>[
                               CupertinoDialogAction(child: const Text("OK",style: TextStyle(color: baseColor),),
                                 onPressed: () => Navigator.pop(context),),
                             ],
                           );
                         }
                     );
                   },
                   () {
                     showDialog(
                         context: context,
                         builder: (context) {
                           return CupertinoAlertDialog(
                             title: const Text('復元に失敗しました。'),
                             content: const Text('最大限アプリを活用いただきますと幸いです。'),
                             actions: <Widget>[
                               CupertinoDialogAction(child: const Text("OK",style: TextStyle(color: baseColor),),
                                 onPressed: () => Navigator.pop(context),),
                             ],
                           );
                         }
                     );
                   },
                   () {
                     showDialog(
                         context: context,
                         builder: (context) {
                           return CupertinoAlertDialog(
                             title: const Text('購入データが存在しませんでした。'),
                             content: const Text('再度有料会員への登録をお願いします。'),
                             actions: <Widget>[
                               CupertinoDialogAction(child: const Text("OK",style: TextStyle(color: baseColor),),
                                 onPressed: () => Navigator.pop(context),),
                             ],
                           );
                         }
                     );
                   },
             );
            },
            child: Container(
                    width: 270.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorSharedPreferenceService().getColor(),
                    ),
                    child: Center(
                        child: Text(
                      '購入を復元する',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: Colors.white),
                    )),
                  ),
          ),
        ],
      ),
    );
  }
}
