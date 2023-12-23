import 'package:flutter/material.dart';

import '../../pages/answer_page.dart';
import '../../pages/grade_page.dart';
import '../../pages/home_page.dart';
import '../../pages/settings_page.dart';




enum TabItem {
  home(
    title: 'ホーム',
    icon: Icons.home,
    page: HomePage(),
  ),

  answer(
    title: '解答',
    icon: Icons.add_card,
    page: AnswerPage(),
  ),

  grade(
    title: '成績',
    icon: Icons.accessible_forward_outlined,
    page: GradePage(),
  ),

  settings(
    title: '設定',
    icon: Icons.settings,
    page: SettingsPage(),
  );

  

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}