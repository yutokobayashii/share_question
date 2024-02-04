import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/repository/grade_data_repository.dart';

import '../data/local/grade_sqflite_dao.dart';
import '../entity/grade_data/grade.dart';
import '../entity/question_data/question.dart';

final gradeDataUseCaseProvider = Provider<GradeDataUseCaseImp>((ref) {
 return GradeDataUseCaseImp();
});

abstract class GradeDataUseCase {
  Future<void> addGradeToSqFlite(WidgetRef ref, Question data);

  Future<List<Grade>> getGradeFromSqLite();

  Grade getGrade(WidgetRef ref, Question data);

  Future<int> updateGradeFromSqLite(Grade grade);

  Future<bool> isGradeExistsInDatabase(String uuid);
}

class GradeDataUseCaseImp implements GradeDataUseCase {
  final _gradeSqfliteDao = GradeSqfliteDao();

  ///sqdliteにデータを格納
  @override
  Future<void> addGradeToSqFlite(WidgetRef ref, Question data) async {
    final gradeDataRepository = ref.watch(gradeDataRepositoryProvider);

    final grade = gradeDataRepository.getGradeData(ref, data);

    await _gradeSqfliteDao.addGradeToDatabase(grade);
  }

  ///sqfliteに格納された全Gradeデータを取得
  @override
  Future<List<Grade>> getGradeFromSqLite() async {
    final grade = await _gradeSqfliteDao.getAllGradesFromDatabase();

    return grade;
  }

  ///単体のGradeデータを取得
  @override
  Grade getGrade(WidgetRef ref, Question data) {
    final gradeDataRepository = ref.watch(gradeDataRepositoryProvider);

    final grade = gradeDataRepository.getGradeData(ref, data);

    return grade;
  }

  ///すでにデータベースにある値を更新
  @override
  Future<int> updateGradeFromSqLite(Grade grade) async {
    final id = await _gradeSqfliteDao.updateGradeToDatabase(grade);
    return id;
  }

  ///値がデータベース上にあるか判定
  @override
  Future<bool> isGradeExistsInDatabase(String uuid) async {
    final status = await _gradeSqfliteDao.isGradeExistsInDatabase(uuid);
    return status;
  }
}
