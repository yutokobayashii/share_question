import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/notifier/login_notifier/login_notifier.dart';
import 'package:share_question/pages/base_page.dart';

import '../login_pages/create_account_pages.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RoutePage extends HookConsumerWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final loginStatus =  ref.read(loginNotifierProvider.notifier).getCurrentUser();
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: FutureBuilder<User?>(
          future: loginStatus,
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if(snapshot.data == null) {
              return const CreateAccountPages();
            }
            else {
              debugPrint(snapshot.data?.email.toString());
              return const BasePage();
            }
          }),
    );
  }
}
