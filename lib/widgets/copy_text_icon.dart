
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_question/constant/color_constant.dart';

class CopyTextIcon extends StatelessWidget {
  final String textToCopy;

  const CopyTextIcon({Key? key, required this.textToCopy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.copy,size: 20,),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: textToCopy));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('テキストをコピーしました',style: TextStyle(color: baseColor),),backgroundColor: Colors.white,),
        );
      },
    );
  }
}