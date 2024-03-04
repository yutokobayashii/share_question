import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/question_number/question_number_repository.dart';

final questionNumberUseCaseProvider = Provider((ref) {
  return QuestionNumberUseCaseImpl(repository: ref.read(questionNumberRepositoryProvider));
});

abstract class QuestionNumberUseCase {
  int getQuestionNumber();

  Future<void> increaseQuestionNumber();

  Future<void> decreaseQuestionNumber();
}

class QuestionNumberUseCaseImpl implements QuestionNumberUseCase {
  @visibleForTesting
  QuestionNumberUseCaseImpl({
    required QuestionNumberRepository repository,
  }) : _repository = repository;

  final QuestionNumberRepository _repository;

  @override
  Future<void> decreaseQuestionNumber() async {
    await _repository.decreaseQuestionNumber();
  }

  @override
  int getQuestionNumber() {
    return _repository.getQuestionNumber();
  }

  @override
  Future<void> increaseQuestionNumber() async {
    await _repository.increaseQuestionNumber();
  }
}
