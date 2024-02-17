
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/initial_question/initial_question.dart';
import '../../usecase/initial_question/initial_question_usecase.dart';

final initialQuestionNotifierProvider = NotifierProvider<InitialQuestionNotifier, void>(InitialQuestionNotifier.new);

class InitialQuestionNotifier extends Notifier<void> {
  @override
  void build() {
    null;
  }

  InitialQuestion get(String name,String author,String explain,String comment) {
   return ref.read(initialQuestionUseCaseProvider).getInitialQuestion(name, author, explain, comment);
  }
}
