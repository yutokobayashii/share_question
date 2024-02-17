
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/question_data/question.dart';
import '../../repository/question_detail/question_detail_repository.dart';

final questionDetailUseCaseProvider = Provider((ref) {
  return QuestionDetailUseCaseImp(repository: ref.read(questionDetailRepositoryProvider));
});

abstract class QuestionDetailUseCase {
  QuestionDetail getQuestionDetail(bool isOptional,String questionName,String image,String correctAnswer,String explanation,List<String> optionalList,);
}

class QuestionDetailUseCaseImp implements QuestionDetailUseCase {
  @visibleForTesting
  QuestionDetailUseCaseImp({
    required QuestionDetailRepository repository,
  }) : _repository = repository;

  final QuestionDetailRepository _repository;

  @override
  QuestionDetail getQuestionDetail(bool isOptional, String questionName, String image, String correctAnswer, String explanation, List<String> optionalList) {
   return _repository.getQuestionDetail(isOptional, questionName, image, correctAnswer, explanation, optionalList);
  }



}





