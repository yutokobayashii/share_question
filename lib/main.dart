import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/pages/base_page.dart';
import 'package:share_question/provider/shared_prefrence_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
       ProviderScope(
          overrides: [
           colorSharedPreferencesProvider.overrideWithValue(
             await SharedPreferences.getInstance(),
  ),
  ],
        child: const BasePage()));


}
