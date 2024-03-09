import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/remote/login_dao.dart';
import '../../entity/create_account_result/create_account_result.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl(dao: LoginDao());
});

abstract class LoginRepository {
  Future<CreateAccountResult?> createAccount(String password, String email);

  Future<UserCredential?> login(String email, String password);

  Future<void> logout();

  Future<void> sendResetPassWordMail(String email);

  Future<UserCredential> signInWithGoogle();
}

class LoginRepositoryImpl implements LoginRepository {
  @visibleForTesting
  LoginRepositoryImpl({
    required LoginDao dao,
  }) : _dao = dao;

  final LoginDao _dao;

  @override
  Future<CreateAccountResult?> createAccount(String password, String email) async {
    return await _dao.createAccount(password, email);
  }

  @override
  Future<UserCredential?> login(String email, String password) async {
    return await _dao.login(email, password);
  }

  @override
  Future<void> logout() async {
    await _dao.logout();
  }

  @override
  Future<void> sendResetPassWordMail(String email) async {
    await _dao.sendResetPassWordMail(email);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    return await _dao.signInWithGoogle();
  }
}
