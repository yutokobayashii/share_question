import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/color_shared_preference_service.dart';
import '../entity/tabbar_data/tab_item_data.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.answer:GlobalKey<NavigatorState>(),
  TabItem.settings: GlobalKey<NavigatorState>(),
};

class BasePage extends HookConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentTab = useState(TabItem.home);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: TabItem.values
              .map(
                (tabItem) => Offstage(
              offstage: currentTab.value != tabItem,
              child: Navigator(
                key: _navigatorKeys[tabItem],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute<Widget>(
                    builder: (context) => getPageWidget(tabItem),
                  );
                },
              ),
            ),
          )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: TabItem.values.indexOf(currentTab.value),
          unselectedItemColor: Colors.black,
          selectedItemColor: ColorSharedPreferenceService().getColor(),
          items: TabItem.values
              .map(
                (tabItem) => BottomNavigationBarItem(
              icon: Icon(tabItem.icon),
              label: tabItem.label,
              backgroundColor: Colors.white,

            ),
          )
              .toList(),
          onTap: (index) {
            // ③ 選択済なら第一階層まで pop / 未選択なら currentTab に指定
            final selectedTab = TabItem.values[index];
            if (currentTab.value == selectedTab) {
              // _navigatorKeys[selectedTab]
              //     ?.currentState
              //     ?.popUntil((route) => route.isFirst);
            } else {
              currentTab.value = selectedTab;
            }
          },
        ),
      ),
    );
  }
}