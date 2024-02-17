
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/initial_question/initial_question.dart';

final initialQuestionRepositoryProvider = Provider<InitialQuestionRepository>((ref) {
  return InitialQuestionRepositoryImp();
});

abstract class InitialQuestionRepository {
  InitialQuestion getInitialQuestion(String name,String author,String explain,String comment);
}

class InitialQuestionRepositoryImp implements InitialQuestionRepository {
  @override
  InitialQuestion getInitialQuestion(String name,String author,String explain,String comment) {
   final initialData = InitialQuestion(
       name: name,
       author: author,
       explain: explain,
       comment: comment);

   return initialData;
  }

}



