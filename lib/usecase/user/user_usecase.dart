
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/repository/user/user_repository.dart';


final userUseCaseProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(repository: ref.read(userRepositoryProvider));
});

abstract class UserUseCase {
  Future<void> updatePassword(User user, String newPassword);

  Future<void> deleteAccount(User user);
}

class UserUseCaseImpl implements UserUseCase {
  @visibleForTesting
  UserUseCaseImpl({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<void> deleteAccount(User user) async {
    await _repository.deleteAccount(user);
  }

  @override
  Future<void> updatePassword(User user, String newPassword) async {
    await _repository.updatePassword(user, newPassword);
  }
}
