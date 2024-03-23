
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/remote/user_info_cloud_dao.dart';

final userInfoRepositoryProvider = Provider((ref) {
  return UserInfoRepositoryImpl(dao: UserInfoCloudDao());
});

abstract class UserInfoRepository {
  Future<String> sendUserInfo(Map<String, dynamic> userInfo);
}

class UserInfoRepositoryImpl implements UserInfoRepository {
  @visibleForTesting
  UserInfoRepositoryImpl({
    required UserInfoCloudDao dao,
  }) : _dao = dao;

  final UserInfoCloudDao _dao;

  @override
  Future<String> sendUserInfo(Map<String, dynamic> userInfo) async {
    return await _dao.sendUserInfo(userInfo);
  }
}

