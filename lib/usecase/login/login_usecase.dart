import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/repository/login/login_repository.dart';

import '../../entity/create_account_result/create_account_result.dart';


final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCaseImpl(repository: ref.read(loginRepositoryProvider));
});

abstract class LoginUseCase {
  Future<CreateAccountResult?> createAccount(String password, String email);

  Future<CreateAccountResult> login(String email, String password);

  Future<bool> logout();

  Future<void> sendResetPassWordMail(String email);

  Future<UserCredential?> signInWithGoogle();

  Future<User?> getCurrentUser();
}

class LoginUseCaseImpl implements LoginUseCase {
  @visibleForTesting
  LoginUseCaseImpl({
    required LoginRepository repository,
  }) : _repository = repository;

  final LoginRepository _repository;

  @override
  Future<CreateAccountResult?> createAccount(String password, String email) async {
    return await _repository.createAccount(password, email);
  }

  @override
  Future<CreateAccountResult> login(String email, String password) async {
    return await _repository.login(email, password);
  }

  @override
  Future<bool> logout() async {
   return await _repository.logout();
  }

  @override
  Future<void> sendResetPassWordMail(String email) async {
    await _repository.sendResetPassWordMail(email);
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    return await _repository.signInWithGoogle();
  }

  @override
  Future<User?> getCurrentUser() async {
    return await _repository.getCurrentUser();
  }
}
