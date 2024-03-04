import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entity/question_data/question.dart';
import '../../repository/cloud_firestore/cloud_firestore_repository.dart';

final cloudFireStoreUseCaseProvider = Provider<CloudFireStoreUseCase>((ref) {

  return CloudFireStoreUseCaseImp(repository: ref.read(cloudFireStoreRepositoryProvider));
});


abstract class CloudFireStoreUseCase {
  Future<String> saveQuestion(Map<String, dynamic> questionData);

  Future<Question?> getQuestion(String documentId);

  Future<bool> deleteQuestion(String documentId);

  Future<void> incrementLikes(String documentId);

  Future<void> incrementAnswerNumber(String documentId);

  Future<String?> getDocumentIdByUuid(String uuid);
}

class CloudFireStoreUseCaseImp implements CloudFireStoreUseCase {
  @visibleForTesting
  CloudFireStoreUseCaseImp({
    required CloudFireStoreRepository repository,
  }) : _repository = repository;

  final CloudFireStoreRepository _repository;

  @override
  Future<bool> deleteQuestion(String documentId) async {
    return await _repository.deleteQuestion(documentId);
  }

  @override
  Future<Question?> getQuestion(String documentId) async {
    return await _repository.getQuestion(documentId);
  }

  @override
  Future<void> incrementLikes(String documentId) async {
    await _repository.incrementLikes(documentId);
  }

  @override
  Future<String> saveQuestion(Map<String, dynamic> questionData) async {
    return await _repository.saveQuestion(questionData);
  }

  @override
  Future<String?> getDocumentIdByUuid(String uuid) async {
    return await _repository.getDocumentIdByUuid(uuid);
  }

  @override
  Future<void> incrementAnswerNumber(String documentId) async {
   await _repository.incrementAnswerNumber(documentId);
  }
}
