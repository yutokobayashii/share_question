import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/inquire/inquire_repository.dart';

final inquireUseCaseProvider = Provider((ref) {
  return InquireUseCaseImpl(repository: ref.read(inquireRepositoryProvider));
});

abstract class InquireUseCase {
  Future<String> sendInquire(Map<String, dynamic> inquireData);
}

class InquireUseCaseImpl implements InquireUseCase {
  @visibleForTesting
  InquireUseCaseImpl({
    required InquireRepository repository,
  }) : _repository = repository;

  final InquireRepository _repository;

  @override
  Future<String> sendInquire(Map<String, dynamic> inquireData) async {
    return await _repository.sendInquire(inquireData);
  }
}
