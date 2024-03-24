import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/notifier/login_notifier/login_notifier.dart';
import 'package:share_question/notifier/mail/mail_notifier.dart';
import 'package:share_question/pages/login_pages/create_account_pages.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/delete_account_modal_widget.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/kiyaku.page.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/privacy_policy_page.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/setting_widget.dart';
import 'package:share_question/util/snackbar.dart';

import '../../constant/style.dart';
import '../../controller/setting_controller/setting_controller.dart';
import '../../dialog/alart_dialog.dart';
import '../change_pass_pages/change_pass_pages.dart';
import '../guide_pages/guide_widget/select_guide_widget.dart';
import '../inquire_pages/inquire_page.dart';
import '../member_status_pages/member_status_pages.dart';
import '../route_page/route_page.dart';
import '../user_info_pages/user_info_pages.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mail = ref.read(mailNotifierProvider.notifier).getMail();
    const int maxLength = 25;

    String mailText() {
      if (mail.length <= maxLength) {
        return mail;
      }
      return '${mail.substring(0, maxLength - 3)}...';
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("設定"),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
           // height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('ユーザー情報', style: boldTextStyle),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'ログイン情報: ${mailText()}',
                    canTap: false,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserInfoPages()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'パスワードを変更',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePassPages()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'ログアウト',
                    color: Colors.red,
                    action: () async {
                      showAlartDialog(
                          context: context,
                          title: 'ログアウトしますか？',
                          content: 'ログアウトすると再度ログインしないとアプリを使用できません。',
                          cancelText: 'ログアウト',
                          okText: '戻る',
                          onCancel: () async {
                            final isLogoutSuccess = await ref
                                .read(loginNotifierProvider.notifier)
                                .logout();

                            if (context.mounted) {
                              if (isLogoutSuccess) {
                                navigatorKey.currentState?.pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccountPages()),
                                  (Route<dynamic> _) => false,
                                );
                              } else {
                                displayErrorSnackBar(ref, context,
                                    "予期せぬエラーが発生しました。\n時間をおいて再度お試しください。");
                              }
                            }
                          },
                          onOK: () {});
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('アプリケーション設定', style: boldTextStyle),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: '会員ステータス',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MemberStatusPages()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'テーマカラー設定',
                    action: () {
                      showColorPalette(context, ref);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('インフォメーション', style: boldTextStyle),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'プライバシーポリシー',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyPage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: '利用規約',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KiyakuPage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: '使い方',
                    action: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
                        builder: (BuildContext context) {
                          return const SelectGuideWidget();
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'お問い合わせ',
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InquirePage()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('その他', style: boldTextStyle),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SettingWidget(
                    title: 'アカウント削除',
                    color: Colors.red,
                    action: () async {
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          isDismissible: true,
                          builder: (BuildContext context) {
                            return const DeleteAccountModalWidget();
                          });
                      // showAlartDialog(
                      //     context: context,
                      //     title: '本当にアカウントを削除しますか？',
                      //     content: '一度アカウントを削除すると作問/解答の履歴は二度と復元できません。',
                      //     cancelText: 'アカウントを削除',
                      //     okText: '戻る',
                      //     onCancel: () async {
                      //
                      //
                      //       // final user = await ref
                      //       //     .read(loginNotifierProvider.notifier)
                      //       //     .getCurrentUser();
                      //       //
                      //       // final isCurrentPassValid = await ref
                      //       //     .read(userNotifierProvider.notifier)
                      //       //     .reAuthenticate(user!, user.);
                      //       //
                      //       //
                      //       // final isSuccess = await ref
                      //       //     .read(userNotifierProvider.notifier)
                      //       //     .deleteAccount(user);
                      //       //
                      //       // if (isSuccess) {
                      //       //   navigatorKey.currentState?.pushAndRemoveUntil(
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) =>
                      //       //             const CreateAccountPages()),
                      //       //     (Route<dynamic> _) => false,
                      //       //   );
                      //       // } else {
                      //       //   if (context.mounted) {
                      //       //     displayErrorSnackBar(ref, context,
                      //       //         "予期せぬエラーが発生しました。\n時間をおいて再度お試し下さい。");
                      //       //   }
                      //       // }
                      //                               },
                      //     onOK: () {});
                    },
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
