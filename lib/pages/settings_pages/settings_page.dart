import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/kiyaku.page.dart';
import 'package:share_question/pages/settings_pages/setting_widgets/privacy_policy_page.dart';
import 'package:share_question/provider/shared_prefrence_provider.dart';

import '../guide_pages/guide_page.dart';

final colorProvider = StateProvider<int>((ref) => ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value);

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("設定")),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GuidePage()),
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

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.title,
    required this.action,
  });

  final String title;
  final VoidCallback action;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width - 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: normalTextStyle,),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}






void showColorPalette(BuildContext context,WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200, // モーダルの高さ
        child: GridView.count(
          crossAxisCount: 5, // 1行あたりの色の数
          children: paletteColors.map((color) {
            return InkWell(
              onTap: () async{

                Navigator.pop(context);

                 ref.read(colorSharedPreferencesProvider).setInt("color", color.value);

                 ref.watch(colorProvider.notifier).update((state) => ref.watch(colorSharedPreferencesProvider).getInt("color")!);

              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }).toList(),
        ),
      );
    },
  );
}


final List<Color> paletteColors = [
  Colors.red,
  Colors.green,
  Colors.cyan,
  Colors.orange,
  Colors.purple,
  // 他の色
];

