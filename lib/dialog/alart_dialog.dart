import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/local/color_shared_preference_service.dart';

void showAlartDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String cancelText,
  required String okText,
  required VoidCallback? onCancel,
  required VoidCallback? onOK,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              onCancel?.call();
            },
            child: Text(cancelText),
          ),
          CupertinoDialogAction(
            child: Text(
              okText,
              style: TextStyle(
              color: ColorSharedPreferenceService()
                  .getColor()
            ),),
            onPressed: () {
              Navigator.pop(context);
              onOK?.call();
            },
          ),
        ],
      );
    },
  );
}
