import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/user_info/user_info_repository.dart';

final userInfoUseCaseProvider = Provider((ref) {
  return UserInfoUseCaseImpl(repository: ref.read(userInfoRepositoryProvider));
});

abstract class UserInfoUseCase {
  Future<String> sendUserInfo(Map<String, dynamic> userInfo);
}

class UserInfoUseCaseImpl implements UserInfoUseCase {
  @visibleForTesting
  UserInfoUseCaseImpl({
    required UserInfoRepository repository,
  }) : _repository = repository;

  final UserInfoRepository _repository;

  @override
  Future<String> sendUserInfo(Map<String, dynamic> userInfo) async {
    return await _repository.sendUserInfo(userInfo);
  }
}

