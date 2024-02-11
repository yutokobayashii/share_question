import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:share_question/entity/question_data/question.dart';

import '../../entity/grade_data/grade.dart';
import '../../notifier/grade/correct_number_notifier.dart';
import '../../notifier/grade/grade_data_notifier.dart';
import '../../util/date_taime_converter.dart';

final gradeDataRepositoryProvider = Provider<GradeDataRepository>((ref) {
  return GradeDataRepositoryImp();
});

abstract class GradeDataRepository {
  Grade getGradeData(WidgetRef ref, Question data,String documentId);
}

class GradeDataRepositoryImp implements GradeDataRepository {
  @override
  Grade getGradeData(WidgetRef ref, Question data,String documentId) {
    final gradeList = ref.watch(gradeDetailListProvider);
    final correctNumber = ref.watch(correctNumberProvider);

    return Grade(
      uuid: data.uuid,
      name: data.name,
      author: data.author,
      lastDate: formatDateTime(DateTime.now()),
      questionNumber: gradeList.length,
      correctNumber: correctNumber,
      comment: data.comment,
      gradeDetailList: gradeList,
      documentId: documentId,
    );
  }
}