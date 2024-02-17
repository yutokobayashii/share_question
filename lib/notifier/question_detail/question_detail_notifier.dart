
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/question_data/question.dart';
import '../../usecase/question_detail/question_detail_usecase.dart';

final questionDetailNotifierProvider = NotifierProvider<QuestionDetailNotifier, void>(QuestionDetailNotifier.new);

class QuestionDetailNotifier extends Notifier<void> {
  @override
  void build() {
   null;
  }

  QuestionDetail getQuestionDetail(bool isOptional,String questionName,String image,String correctAnswer,String explanation,List<String> optionalList,) {
    return ref.read(questionDetailUseCaseProvider).getQuestionDetail(
        isOptional,
        questionName,
        image,
        correctAnswer,
        explanation,
        optionalList);
  }
}
