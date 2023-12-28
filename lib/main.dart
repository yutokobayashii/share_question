import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/pages/base_page.dart';



void main() {
  runApp(
      const ProviderScope(
        child: BasePage()));
}
