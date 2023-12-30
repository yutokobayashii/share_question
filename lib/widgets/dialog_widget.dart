


import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';

import '../provider/shared_prefrence_provider.dart';

class AlertDialogWidget extends HookConsumerWidget {

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.leftText,
    required this.rightText,
    required this.rightAction,
    required this.leftAction,
  });

  final String title;
  final String content;
  final String leftText;
  final String rightText;
  final VoidCallback rightAction;
  final VoidCallback leftAction;



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: leftAction,
          child: Text(leftText,
            style: TextStyle(
              color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value)
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: rightAction,
          child: Text(rightText,
            style: TextStyle(
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value)
            ),
          ),
        ),
      ],
    );
  }
}
