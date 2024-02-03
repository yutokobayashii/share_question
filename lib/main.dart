import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/db/grade_sq_flite_db.dart';
import 'package:share_question/pages/base_page.dart';
import 'package:share_question/provider/shared_prefrence_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/isar_db.dart';
import 'db/question_sq_flite_db.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await IsarDB.init();

  await QuestionSqFliteDB.init();

  await GradeSqFliteDB.init();

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
