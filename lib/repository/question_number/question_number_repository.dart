import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/question_number_shared_preference_service.dart';

final questionNumberRepositoryProvider = Provider<QuestionNumberRepository>((ref) {
  return QuestionNumberRepositoryImpl(service: QuestionNumberSharedPreferenceService());
});

abstract class QuestionNumberRepository {
  int getQuestionNumber();

  Future<void> increaseQuestionNumber();

  Future<void> decreaseQuestionNumber();
}

class QuestionNumberRepositoryImpl implements QuestionNumberRepository {
  @visibleForTesting
  QuestionNumberRepositoryImpl({
    required QuestionNumberSharedPreferenceService service,
  }) : _service = service;

  final QuestionNumberSharedPreferenceService _service;

  @override
  Future<void> decreaseQuestionNumber() async {
    await _service.decreaseQuestionNumber();
  }

  @override
  int getQuestionNumber() {
    return _service.getQuestionNumber();
  }

  @override
  Future<void> increaseQuestionNumber() async {
    await _service.increaseQuestionNumber();
  }
}
