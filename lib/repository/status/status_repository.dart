import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/is_payed_shared_preference_service.dart';

final statusRepositoryProvider = Provider<StatusRepository>((ref) {
  return StatusRepositoryImpl(service: StatusSharedPreferenceService());
});

abstract class StatusRepository {
  bool getStatus();

  Future<void> toPayed();

  Future<void> toFree();
}

class StatusRepositoryImpl implements StatusRepository {
  @visibleForTesting
  StatusRepositoryImpl({
    required StatusSharedPreferenceService service,
  }) : _service = service;

  final StatusSharedPreferenceService _service;

  @override
  bool getStatus() {
    return _service.getStatus();
  }

  @override
  Future<void> toFree() async {
    await _service.toFree();
  }

  @override
  Future<void> toPayed() async {
    await _service.toPayed();
  }
}
