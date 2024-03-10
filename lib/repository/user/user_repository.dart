import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/remote/user_dao.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(dao: UserDao());
});

abstract class UserRepository {
  Future<void> updatePassword(User user, String newPassword);

  Future<void> deleteAccount(User user);

  Future<void> renewPassword(User user, String newPassword);

  Future<bool> reAuthenticate(User user,String oldPassword);
}

class UserRepositoryImpl implements UserRepository {
  @visibleForTesting
  UserRepositoryImpl({
    required UserDao dao,
  }) : _dao = dao;

  final UserDao _dao;

  @override
  Future<void> deleteAccount(User user) async {
    await _dao.deleteAccount(user);
  }

  @override
  Future<void> updatePassword(User user, String newPassword) async {
    await _dao.updatePassword(user, newPassword);
  }

  @override
  Future<void> renewPassword(User user, String newPassword) async {
    await _dao.renewPassword(user, newPassword);
  }

  @override
  Future<bool> reAuthenticate(User user, String oldPassword) async {
    return await _dao.reAuthenticate(user, oldPassword);
  }
}
