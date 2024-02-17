
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/question_data/question.dart';

final questionDetailRepositoryProvider = Provider((ref) {
  return QuestionDetailRepositoryImp();
});

abstract class QuestionDetailRepository {
  QuestionDetail getQuestionDetail(bool isOptional,String questionName,String image,String correctAnswer,String explanation,List<String> optionalList,);
}

class QuestionDetailRepositoryImp implements QuestionDetailRepository {
  @override
  QuestionDetail getQuestionDetail(bool isOptional, String questionName, String image, String correctAnswer, String explanation, List<String> optionalList) {
    return QuestionDetail(
        isOptional: isOptional,
        questionName: questionName,
        image: image,
        correctAnswer: correctAnswer,
        explanation: explanation,
        optionalList:[
          for(int i = 0; i<optionalList.length; i++)...{
            OptionalQuestion(optional: optionalList[i])
          }
        ]);
  }

}



