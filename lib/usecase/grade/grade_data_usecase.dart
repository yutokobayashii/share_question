
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/grade_data/grade.dart';
import '../../entity/question_data/question.dart';
import '../../repository/grade/grade_data_repository.dart';

final gradeDataUseCaseProvider = Provider<GradeDataUseCaseImp>((ref) {
  return GradeDataUseCaseImp(repository: ref.read(gradeDataRepositoryProvider));
});

abstract class GradeDataUseCase {
  Future<void> addGradeToSqFlite(
      WidgetRef ref, Question data, String documentId);

  Future<List<Grade>> getGradeFromSqLite();

  Grade getGrade(WidgetRef ref, Question data, String documentId);

  Future<int> updateGradeFromSqLite(Grade grade);

  Future<bool> isGradeExistsInDatabase(String uuid);

  Future<int> updateGradeToDatabaseForIsLiked(Grade grade);
}

class GradeDataUseCaseImp implements GradeDataUseCase {

  GradeDataUseCaseImp({
    required GradeDataRepository repository,
  }) : _repository = repository;

  final GradeDataRepository _repository;


  @override
  Future<void> addGradeToSqFlite(WidgetRef ref, Question data, String documentId) async {
   await _repository.addGradeToSqFlite(ref, data, documentId);
  }

  @override
  Grade getGrade(WidgetRef ref, Question data, String documentId) {
    return _repository.getGrade(ref, data, documentId);
  }

  @override
  Future<List<Grade>> getGradeFromSqLite() async {
   return await _repository.getGradeFromSqLite();
  }

  @override
  Future<bool> isGradeExistsInDatabase(String uuid) async {
    return await _repository.isGradeExistsInDatabase(uuid);
  }

  @override
  Future<int> updateGradeFromSqLite(Grade grade) async {
    return await _repository.updateGradeFromSqLite(grade);
  }

  @override
  Future<int> updateGradeToDatabaseForIsLiked(Grade grade) async {
    return await _repository.updateGradeToDatabaseForIsLiked(grade);
  }
 
  
}

