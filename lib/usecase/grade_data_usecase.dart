import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/repository/grade_data_repository.dart';

import '../data/local/grade_sqflite_dao.dart';
import '../entity/grade_data/grade.dart';
import '../entity/question_data/question.dart';

class GradeDataUseCase {
  final _gradeSqfliteDao = GradeSqfliteDao();

  ///sqdliteにデータを格納
  Future<void> addGradeToSqFlite(WidgetRef ref, Question data) async {
    final gradeDataRepository = ref.watch(gradeDataRepositoryProvider);

    final grade = gradeDataRepository.getGradeData(ref, data);

    await _gradeSqfliteDao.addGradeToDatabase(grade);
  }

  ///sqfliteに格納された全Gradeデータを取得
  Future<List<Grade>> getGradeFromSqLite() async {
    final grade = await _gradeSqfliteDao.getAllGradesFromDatabase();

    return grade;
  }

  ///単体のGradeデータを取得
  Grade getGrade(WidgetRef ref, Question data) {
    final gradeDataRepository = ref.watch(gradeDataRepositoryProvider);

    final grade = gradeDataRepository.getGradeData(ref, data);

    return grade;
  }

  Future<int> updateGradeFromSqLite(Grade grade) async {
    final id = await _gradeSqfliteDao.updateGradeToDatabase(grade);
    return id;
  }

  Future<bool> isGradeExistsInDatabase(String uuid) async {
    final status = await _gradeSqfliteDao.isGradeExistsInDatabase(uuid);
    return status;
  }
}
