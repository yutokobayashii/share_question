import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/pages/base_page.dart';
import 'package:share_question/provider/shared_prefrence_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
       ProviderScope(
          overrides: [
           colorSharedPreferencesProvider.overrideWithValue(
             await SharedPreferences.getInstance(),
  ),
  ],
        child: const BasePage()));


}
