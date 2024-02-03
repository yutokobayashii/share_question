
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/local/color_shared_preference_service.dart';

class GuidePageWidget extends HookConsumerWidget {
  const GuidePageWidget(  {
    super.key,
    required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final currentPage = useState(0);
    final PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
            Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 28,
            )
        ),
        title: Text(title),

      ),
      body: Container(
        color: Colors.white,
        child:  Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int page) {
                  currentPage.value = page;
                },
                children: [
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.blue),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // ページ数
                    (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage.value == index
                        ? ColorSharedPreferenceService().getColor()// 現在のページ
                        : Colors.grey, // 他のページ
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}