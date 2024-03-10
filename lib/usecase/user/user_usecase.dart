
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

  Future<void> renewPassword(User user, String newPassword);

  Future<bool> reAuthenticate(User user,String oldPassword);
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

  @override
  Future<void> renewPassword(User user, String newPassword) async {
    await _repository.renewPassword(user, newPassword);
  }

  @override
  Future<bool> reAuthenticate(User user, String oldPassword) async {
    return await _repository.reAuthenticate(user, oldPassword);
  }
}
