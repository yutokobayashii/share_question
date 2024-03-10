
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/create_account_result/create_account_result.dart';
import '../../usecase/login/login_usecase.dart';

final loginNotifierProvider = NotifierProvider<LoginNotifier, void>(LoginNotifier.new);

class LoginNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<CreateAccountResult?> createAccount(String password, String email) async {
    return await ref.read(loginUseCaseProvider).createAccount(password, email);
  }

  Future<CreateAccountResult> login(String email, String password) async {
    return await ref.read(loginUseCaseProvider).login(email, password);
  }

  Future<bool> logout() async {
   return await ref.read(loginUseCaseProvider).logout();
  }

  Future<void> sendResetPassWordMail(String email) async {
    await ref.read(loginUseCaseProvider).sendResetPassWordMail(email);
  }

  Future<UserCredential?> signInWithGoogle() async {
    return await ref.read(loginUseCaseProvider).signInWithGoogle();
  }

  Future<User?> getCurrentUser() async {
    return await ref.read(loginUseCaseProvider).getCurrentUser();
  }
}