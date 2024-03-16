import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/data/remote/question_cloud_dao.dart';

import '../../entity/question_data/question.dart';


final cloudFireStoreRepositoryProvider =
Provider<CloudFireStoreRepository>((ref) {
  return CloudFireStoreRepositoryImp();
});

abstract class CloudFireStoreRepository {
  Future<String> saveQuestion(Map<String, dynamic> questionData);

  Future<Question?> getQuestion(String documentId);

  Future<bool> deleteQuestion(String documentId);

  Future<void> incrementLikes(String documentId);

  Future<void> incrementAnswerNumber(String documentId);

  Future<String?> getDocumentIdByUuid(String uuid);

  Future<List<Question>> getSortedQuestions();
}

class CloudFireStoreRepositoryImp implements CloudFireStoreRepository {

  final _dao = QuestionCloudDao();

  @override
  Future<bool> deleteQuestion(String documentId) async {
    return await _dao.deleteQuestion(documentId);
  }

  @override
  Future<Question?> getQuestion(String documentId) async {
    return await _dao.getQuestion(documentId);
  }

  @override
  Future<void> incrementLikes(String documentId) async {
    await _dao.incrementLikes(documentId);
  }

  @override
  Future<String> saveQuestion(Map<String, dynamic> questionData) async {
    return await _dao.saveQuestion(questionData);
  }

  @override
  Future<String?> getDocumentIdByUuid(String uuid) async {
    return await _dao.getDocumentIdByUuid(uuid);
  }

  @override
  Future<void> incrementAnswerNumber(String documentId) async {
    await _dao.incrementAnswerNumber(documentId);
  }

  @override
  Future<List<Question>> getSortedQuestions() async {
    return await _dao.getSortedQuestions();
  }

}
