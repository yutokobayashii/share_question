import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/mail/mail_repository.dart';

final mailUseCaseProvider = Provider((ref) {
  return MailUseCaseImpl(repository: ref.read(mailRepositoryProvider));
});

abstract class MailUseCase {
  String getMail();

  Future<void> setMail(String mail);
}

class MailUseCaseImpl implements MailUseCase {
  @visibleForTesting
  MailUseCaseImpl({
    required MailRepository repository,
  }) : _repository = repository;

  final MailRepository _repository;

  @override
  String getMail() {
    return _repository.getMail();
  }

  @override
  Future<void> setMail(String mail) async {
    await _repository.setMail(mail);
  }
}