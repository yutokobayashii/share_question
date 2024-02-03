
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/color_shared_preference_service.dart';

class CopyTextIcon extends HookConsumerWidget {
  final String textToCopy;

  const CopyTextIcon({Key? key, required this.textToCopy}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.copy,size: 20,),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: textToCopy));
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('テキストをコピーしました',style: TextStyle(color: ColorSharedPreferenceService().getColor(),),),backgroundColor: Colors.white,),
        );
      },
    );
  }
}