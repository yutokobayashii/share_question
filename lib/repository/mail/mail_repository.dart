import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/mail_shared_preference_service.dart';


final mailRepositoryProvider = Provider((ref) {
  return MailRepositoryImpl(service: MailSharedPreferenceService());
});

abstract class MailRepository {
  String getMail();

  Future<void> setMail(String mail);
}

class MailRepositoryImpl implements MailRepository {
  @visibleForTesting
  MailRepositoryImpl({
    required MailSharedPreferenceService service,
  }) : _service = service;

  final MailSharedPreferenceService _service;

  @override
  String getMail() {
    return _service.getMail();
  }

  @override
  Future<void> setMail(String mail) async {
    await _service.setMail(mail);
  }
}
