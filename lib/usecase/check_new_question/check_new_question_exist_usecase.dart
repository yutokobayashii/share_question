import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/question_data/question.dart';

import '../../repository/library/library_data_repoditory.dart';

class CheckNewQuestionExistUseCase {
  bool checkExist(WidgetRef ref, Question newQuestion) {
    final List<String> uuidList = [];

    final questionList =
        ref.watch(libraryRepositoryProvider).asData?.value ?? [];

    ///すでに保存されているデータのuuidを配列で取得
    for (int i = 0; i < questionList.length; i++) {
      final list = questionList[i].uuid;

      uuidList.add(list);
    }

    for (int i = 0; i < uuidList.length; i++) {
      if (newQuestion.uuid == uuidList[i]) {
        return true;
      }
    }
    return false;
  }
}
