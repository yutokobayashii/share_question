



import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/initial_question_provider.dart';
import '../provider/make_question_provider.dart';

abstract class QuestionDataRepository {
  Map<String, dynamic> createQuestionData(WidgetRef ref);
}

class QuestionDataRepositoryImp implements QuestionDataRepository {
  @override
  Map<String, dynamic> createQuestionData(WidgetRef ref) {

    final now = DateTime.now();

    final questionDetailList  =  ref.watch(MakeQuestionProvider.questionDetailListProvider);
    return {
      'name': ref.watch(InitialMakeQuestionProvider.questionNameProvider),
      'author': ref.watch(InitialMakeQuestionProvider.authorProvider),
      'explain': ref.watch(InitialMakeQuestionProvider.explainProvider),
      'comment': ref.watch(InitialMakeQuestionProvider.commentProvider),
      'createdAt':"${now.year}/${now.month}/${now.day}",
      'favorite':0,
      'questionDetailList': [

        for(int i = 0; i< questionDetailList.length; i++) ...{
          {
            'isOptional': questionDetailList[i].isOptional,
            'questionName': questionDetailList[i].questionName,
            'image': questionDetailList[i].image,
            'correctAnswer': questionDetailList[i].correctAnswer,
            'explanation': questionDetailList[i].explanation,
            'optionalList': [
              for(int i2 = 0; i2< questionDetailList[i].optionalList.length; i2++) ...{
                {'optional': questionDetailList[i].optionalList[i2].optional},
              }
            ],
          },
        }
      ],
    };
  }
}

