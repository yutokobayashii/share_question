import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:share_question/db/grade_sq_flite_db.dart';
import 'package:share_question/pages/route_page/route_page.dart';

import 'data/local/shared_preference_instance.dart';
import 'db/isar_db.dart';
import 'db/question_sq_flite_db.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await IsarDB.init();

  await QuestionSqFliteDB.init();

  await GradeSqFliteDB.init();

  await SharedPreferencesInstance.initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) => runApp(const ProviderScope(
        overrides: [],
        child: RoutePage(),
      )));
}
