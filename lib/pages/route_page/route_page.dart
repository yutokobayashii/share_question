import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/notifier/login_notifier/login_notifier.dart';
import 'package:share_question/pages/base_page.dart';

import '../../notifier/in_app_purchase/in_app_purchase_notifier.dart';
import '../../notifier/status/status_notifier.dart';
import '../login_pages/create_account_pages.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RoutePage extends HookConsumerWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    useEffect(() {
      Future<void> initAsync() async {
        final user = await ref.read(loginNotifierProvider.notifier).getCurrentUser();

       await ref.read(inAppPurchaseNotifierProvider.notifier).initInAppPurchase(user?.uid ?? "",
               () async {
                 await ref.read(statusNotifierProvider.notifier).toFree();
                 ref.invalidate(statusNotifierProvider);
                 print('無料');
               },
               () async {
                 await ref.read(statusNotifierProvider.notifier).toPayed();
                 ref.invalidate(statusNotifierProvider);
                 print("有料");
               },
               () {});
      }

      initAsync();

      return null; // クリーンアップが必要ない場合はnullを返す
    }, const []); // 空の配列を渡すことで、コンポーネントのマウント時に一度だけ実行される

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
