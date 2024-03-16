import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/remote/inquire_cloud_dao.dart';

final inquireRepositoryProvider = Provider((ref) {
  return InquireRepositoryImpl(dao: InquireCloudDao());
});

abstract class InquireRepository {
  Future<String> sendInquire(Map<String, dynamic> inquireData);
}

class InquireRepositoryImpl implements InquireRepository {
  @visibleForTesting
  InquireRepositoryImpl({
    required InquireCloudDao dao,
  }) : _dao = dao;

  final InquireCloudDao _dao;

  @override
  Future<String> sendInquire(Map<String, dynamic> inquireData) async {
    return await _dao.sendInquire(inquireData);
  }
}
