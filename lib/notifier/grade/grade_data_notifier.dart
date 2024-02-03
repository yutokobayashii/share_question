

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/grade_data/grade.dart';

final gradeListProvider = NotifierProvider<GradeNotifier, List<GradeDetail>>(() => GradeNotifier());

class GradeNotifier extends Notifier<List<GradeDetail>> {
  @override
  List<GradeDetail> build() {

    return [];
  }

  void addGradeDetail(String questionName, String correct, String yourAnswer, String explain) {
    // 新しいGradeDetailインスタンスを作成
    final newGradeDetail = GradeDetail(
      questionName: questionName,
      correct: correct,
      yourAnswer: yourAnswer,
      explain: explain,
    );

    // 現在の状態に新しいGradeDetailを追加して更新
    state = [...state, newGradeDetail];
  }
}