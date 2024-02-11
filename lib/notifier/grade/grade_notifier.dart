import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/grade_data/grade.dart';
import '../../entity/question_data/question.dart';
import '../../usecase/grade/grade_data_usecase.dart';

final gradeListNotifierProvider =
    NotifierProvider<GradeListNotifier, void>(
        GradeListNotifier.new);

class GradeListNotifier extends Notifier<void> {
  @override
  void build() {

  }

  Future<void> addGradeToSqFlite(
      WidgetRef ref, Question data, String documentId) async {
    await ref
        .read(gradeDataUseCaseProvider)
        .addGradeToSqFlite(ref, data, documentId);
  }

  Future<List<Grade>> getGradeFromSqLite() async {
    return await ref.read(gradeDataUseCaseProvider).getGradeFromSqLite();
  }

  Grade getGrade(WidgetRef ref, Question data, String documentId) {
    return ref.read(gradeDataUseCaseProvider).getGrade(ref, data, documentId);
  }

  Future<int> updateGradeFromSqLite(Grade grade) async {
    return await ref.read(gradeDataUseCaseProvider).updateGradeFromSqLite(grade);
  }

  Future<bool> isGradeExistsInDatabase(String uuid) async {
    return await ref.read(gradeDataUseCaseProvider).isGradeExistsInDatabase(uuid);
  }

  Future<int> updateGradeToDatabaseForIsLiked(Grade grade) async {
    return await ref.read(gradeDataUseCaseProvider).updateGradeToDatabaseForIsLiked(grade);
  }
}
