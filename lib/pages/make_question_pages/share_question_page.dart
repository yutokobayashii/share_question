
import 'package:flutter/material.dart';

import '../../widgets/dialog_widget.dart';

class ShareQuestionPage extends StatelessWidget {
  const ShareQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              )
          ),
          title: const Text('共有'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context1) => AlertDialogWidget(
                      title: '作問を中止しますか？',
                      content: '中止すると入力した項目は保存されません',
                      leftText: '中止する',
                      rightText: '続ける',
                      rightAction: () {
                        Navigator.pop(context1);
                      },
                      leftAction: () {
                        Navigator.pop(context1);
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },

                    ),
                  );
                },
                child: const Icon(Icons.close,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            )
          ],

        ),
        body: const Center(
          child: Text('aaaa'),
        ),
      ),
    );
  }
}
