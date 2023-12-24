


import 'package:flutter/cupertino.dart';
import 'package:share_question/constant/color_constant.dart';

class AlertDialogWidget extends StatelessWidget {

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
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: leftAction,
          child: Text(leftText,
            style: const TextStyle(
              color: baseColor
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: rightAction,
          child: Text(rightText,
            style: const TextStyle(
                color: baseColor
            ),
          ),
        ),
      ],
    );
  }
}
