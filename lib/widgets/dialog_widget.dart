import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/color_shared_preference_service.dart';

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
              color: ColorSharedPreferenceService().getColor(),
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: rightAction,
          child: Text(rightText,
            style: TextStyle(
                color: ColorSharedPreferenceService().getColor(),
            ),
          ),
        ),
      ],
    );
  }
}
