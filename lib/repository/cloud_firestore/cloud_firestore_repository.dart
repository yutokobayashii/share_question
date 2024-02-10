import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/data/remote/cloud_dao.dart';

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
}

class CloudFireStoreRepositoryImp implements CloudFireStoreRepository {

  final _dao = CloudDao();

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

}
