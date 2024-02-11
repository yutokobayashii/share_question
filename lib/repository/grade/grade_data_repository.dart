import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/grade_sqflite_dao.dart';
import '../../entity/grade_data/grade.dart';
import '../../entity/question_data/question.dart';
import '../../notifier/grade/correct_number_notifier.dart';
import '../../notifier/grade/grade_data_notifier.dart';
import '../../util/date_taime_converter.dart';

final gradeDataRepositoryProvider = Provider<GradeDataRepositoryImp>((ref) {
  return GradeDataRepositoryImp();
});

abstract class GradeDataRepository {
  Future<void> addGradeToSqFlite(
      WidgetRef ref, Question data, String documentId);

  Future<List<Grade>> getGradeFromSqLite();

  Grade getGrade(WidgetRef ref, Question data, String documentId);

  Future<int> updateGradeFromSqLite(Grade grade);

  Future<bool> isGradeExistsInDatabase(String uuid);

  Future<int> updateGradeToDatabaseForIsLiked(Grade grade);
}

class GradeDataRepositoryImp implements GradeDataRepository {
  final _gradeSqfliteDao = GradeSqfliteDao();

  ///sqdliteにデータを格納
  @override
  Future<void> addGradeToSqFlite(
      WidgetRef ref, Question data, String documentId) async {
    final gradeList = ref.watch(gradeDetailListProvider);
    final correctNumber = ref.watch(correctNumberProvider);
    final grade = Grade(
      uuid: data.uuid,
      name: data.name,
      author: data.author,
      lastDate: formatDateTime(DateTime.now()),
      questionNumber: gradeList.length,
      correctNumber: correctNumber,
      comment: data.comment,
      gradeDetailList: gradeList,
      documentId: documentId,
      isLiked: false,
    );

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
  Grade getGrade(WidgetRef ref, Question data, String documentId) {
    final gradeList = ref.watch(gradeDetailListProvider);
    final correctNumber = ref.watch(correctNumberProvider);
    final grade = Grade(
      uuid: data.uuid,
      name: data.name,
      author: data.author,
      lastDate: formatDateTime(DateTime.now()),
      questionNumber: gradeList.length,
      correctNumber: correctNumber,
      comment: data.comment,
      gradeDetailList: gradeList,
      documentId: documentId,
      isLiked: false,
    );

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

  @override
  Future<int> updateGradeToDatabaseForIsLiked(Grade grade) async {

    return await _gradeSqfliteDao.updateGradeToDatabaseForIsLiked(grade);
  }
}
