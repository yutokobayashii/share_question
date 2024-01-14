import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/kiyaku.page.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/privacy_policy_page.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/setting_widget.dart';
import 'package:share_question/provider/shared_prefrence_provider.dart';

import '../../constant/style.dart';
import '../../controller/setting_controller/setting_controller.dart';
import '../guide_pages/guide_widget/select_guide_widget.dart';


final colorProvider = StateProvider<int>((ref) => ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value);

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("設定"),
          backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20.h,),

               Text('カレンダー',
                style: boldTextStyle),

              SizedBox(height: 15.h,),

              SettingWidget(
                title: '解答実績カレンダー',
                action: () {

                },),

              SizedBox(height: 15.h,),

               Text('アプリケーション設定',
                style: boldTextStyle),

              SizedBox(height: 15.h,),

               SettingWidget(
                title: '会員ステータス',
                action: () {

                },),

              SizedBox(height: 15.h,),

              SettingWidget(
                title: 'テーマカラー設定',
                action: () {
                  showColorPalette(context,ref);
                },),


              SizedBox(height: 20.h,),

               Text('インフォメーション',
                 style: boldTextStyle),

              SizedBox(height: 15.h,),

              SettingWidget(
                title: '使い方',
                action: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const GuidePage()),
                  // );
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
                    builder: (BuildContext context) {
                      return const SelectGuideWidget();
                    },
                  );
                },),

              SizedBox(height: 15.h,),

              SettingWidget(
                title: 'プライバシーポリシー',
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
                  );
                },),

              SizedBox(height: 15.h,),

              SettingWidget(
                title: '利用規約',
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KiyakuPage()),
                  );
                },),
            ],
          ),
        ),
      )
    );
  }
}









