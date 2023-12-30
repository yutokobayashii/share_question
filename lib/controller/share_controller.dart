

import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';

void shareText(BuildContext context, String text) async {
  final box = context.findRenderObject() as RenderBox?;
  await Share.share(text,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}