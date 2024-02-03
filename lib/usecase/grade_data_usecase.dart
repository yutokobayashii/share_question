import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/repository/grade_data_repository.dart';

import '../data/local/grade_sqflite_dao.dart';
import '../entity/grade_data/grade.dart';
import '../entity/question_data/question.dart';

class GradeDataUseCase {
  final _gradeSqfliteDao = GradeSqfliteDao();

  Future<void> addGradeToSqFlite(WidgetRef ref, Question data) async {
    final gradeDataRepository = ref.watch(gradeDataRepositoryProvider);

    final grade = gradeDataRepository.getGradeData(ref, data);

    await _gradeSqfliteDao.addGradeToDatabase(grade);
  }

  Future<List<Grade>> getGradeFromSqLite() async {
    final gradeSqfliteDao = GradeSqfliteDao();

    final grade = await gradeSqfliteDao.getAllGradesFromDatabase();

    return grade;
  }

  Grade getGrade(WidgetRef ref, Question data) {
    final gradeDataRepository = ref.watch(gradeDataRepositoryProvider);

    final grade = gradeDataRepository.getGradeData(ref, data);

    return grade;
  }

//todo:ここにデータベースから取得するコードを書く
}
