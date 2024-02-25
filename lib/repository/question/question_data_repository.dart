import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/initial_question/initial_question.dart';
import 'package:uuid/uuid.dart';

import '../../entity/question_data/question.dart';

abstract class QuestionDataRepository {
  Map<String, dynamic> createQuestionData(WidgetRef ref,InitialQuestion initial,List<QuestionDetail> questionDetail);
}

class QuestionDataRepositoryImp implements QuestionDataRepository {
  @override
  Map<String, dynamic> createQuestionData(WidgetRef ref,InitialQuestion initial,List<QuestionDetail> questionDetail) {
    final now = DateTime.now();

    return {
      'uuid': const Uuid().v4(),
      'name': initial.name,
      'author': initial.author,
      'explain': initial.explain,
      'comment': initial.comment,
      'createdAt': "${now.year}/${now.month}/${now.day}",
      'favorite': 0,
      'questionDetailList': [
        for(int i = 0; i< questionDetail.length; i++) ...{
          {
            'isOptional': questionDetail[i].isOptional,
            'questionName': questionDetail[i].questionName,
            'image': questionDetail[i].image,
            'correctAnswer': questionDetail[i].correctAnswer,
            'explanation': questionDetail[i].explanation,
            'optionalList': questionDetail[i].optionalList,
          },
        }

      ]

    };
  }
}
