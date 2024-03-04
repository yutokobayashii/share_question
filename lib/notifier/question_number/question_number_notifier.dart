

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../usecase/question_number/question_number_usecase.dart';

final questionNumberNotifierProvider = NotifierProvider<QuestionNumberUseCaseNotifier, void>(QuestionNumberUseCaseNotifier.new);

class QuestionNumberUseCaseNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  int getQuestionNumber() {
    return ref.read(questionNumberUseCaseProvider).getQuestionNumber();
  }

  Future<void> increaseQuestionNumber() async {
    await ref.read(questionNumberUseCaseProvider).increaseQuestionNumber();
  }

  Future<void> decreaseQuestionNumber() async {
    await ref.read(questionNumberUseCaseProvider).decreaseQuestionNumber();
  }
}