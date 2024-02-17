
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/initial_question/initial_question.dart';
import '../../repository/initial_question/initial_question_repository.dart';

final initialQuestionUseCaseProvider = Provider<InitialQuestionUseCase>((ref) {
  return InitialQuestionUseCaseImp(repository: ref.read(initialQuestionRepositoryProvider));
});

abstract class InitialQuestionUseCase {
  InitialQuestion getInitialQuestion(String name,String author,String explain,String comment);
}

class InitialQuestionUseCaseImp implements InitialQuestionUseCase {
  @visibleForTesting
  InitialQuestionUseCaseImp({
    required InitialQuestionRepository repository,
  }) : _repository = repository;

  final InitialQuestionRepository _repository;

  @override
  InitialQuestion getInitialQuestion(String name, String author, String explain, String comment) {
   return _repository.getInitialQuestion(name, author, explain, comment);

  }
 
}



