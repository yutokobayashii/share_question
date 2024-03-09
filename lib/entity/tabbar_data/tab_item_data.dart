import 'package:flutter/material.dart';

import '../../pages/answer_pages/answer_page.dart';
import '../../pages/grade_pages/grade_page.dart';
import '../../pages/home_pages/home_page.dart';
import '../../pages/login_pages/login_pages.dart';
import '../../pages/settings_pages/settings_page.dart';




enum TabItem {
  home(
      Icons.home,
      "ホーム"
  ),
  answer(
      Icons.create,
      "解答"
  ),
  grade(
      Icons.leaderboard,
      "成績"
  ),
  settings(
      Icons.settings,
      "設定"
  ),

  login(
      Icons.login,
      "ログイン"
      );

  const TabItem(this.icon,this.label);

  final IconData icon;
  final String label;
}


Widget getPageWidget(TabItem item) {
  switch (item) {
    case TabItem.home:
      return const HomePage();
    case TabItem.answer:
      return const AnswerPage();

    case TabItem.grade:
      return const GradePage();

    case TabItem.settings:
      return const SettingsPage();

    case TabItem.login:
      return const LoginPages();


  }
}