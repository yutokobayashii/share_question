import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../model/tabbar_model/tab_item_data.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.answer:GlobalKey<NavigatorState>(),
  TabItem.settings: GlobalKey<NavigatorState>(),
};

class BasePage extends HookWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ① useState で選択状態の管理
    final currentTab = useState(TabItem.home);
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: TabItem.values
              .map(
                (tabItem) => Offstage(
              offstage: currentTab.value != tabItem,
              // ② 各ページの Navigator に NavigatorState を持った Key を渡す
              child: Navigator(
                key: _navigatorKeys[tabItem],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute<Widget>(
                    builder: (context) => tabItem.page,
                  );
                },
              ),
            ),
          )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: TabItem.values.indexOf(currentTab.value),
          items: TabItem.values
              .map(
                (tabItem) => BottomNavigationBarItem(
              icon: Icon(tabItem.icon),
              label: tabItem.title,
            ),
          )
              .toList(),
          onTap: (index) {
            // ③ 選択済なら第一階層まで pop / 未選択なら currentTab に指定
            final selectedTab = TabItem.values[index];
            if (currentTab.value == selectedTab) {
              _navigatorKeys[selectedTab]
                  ?.currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              currentTab.value = selectedTab;
            }
          },
        ),
      ),
    );
  }
}