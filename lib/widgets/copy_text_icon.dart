
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';

import '../provider/shared_prefrence_provider.dart';

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
           SnackBar(content: Text('テキストをコピーしました',style: TextStyle(color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value)),),backgroundColor: Colors.white,),
        );
      },
    );
  }
}