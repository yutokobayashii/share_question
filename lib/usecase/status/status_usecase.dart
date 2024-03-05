import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/status/status_repository.dart';

final statusUseCaseProvider = Provider<StatusUseCase>((ref) {
  return StatusUseCaseImpl(repository: ref.read(statusRepositoryProvider));
});

abstract class StatusUseCase {
  bool getStatus();

  Future<void> toPayed();

  Future<void> toFree();
}

class StatusUseCaseImpl implements StatusUseCase {
  @visibleForTesting
  StatusUseCaseImpl({
    required StatusRepository repository,
  }) : _repository = repository;

  final StatusRepository _repository;

  @override
  bool getStatus() {
    return _repository.getStatus();
  }

  @override
  Future<void> toFree() async {
    await _repository.toFree();
  }

  @override
  Future<void> toPayed() async {
    await _repository.toPayed();
  }
}