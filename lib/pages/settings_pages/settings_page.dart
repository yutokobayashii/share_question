import 'package:flutter/material.dart';

import '../../model/tabbar_model/tab_item_data.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageTitle = TabItem.settings.title;
    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pageTitle),
            GestureDetector(
              onTap: () {
                print('hello');
              },
                child: const Text('詳細ページへ',
                  style: TextStyle(
                    color: Colors.pink
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}