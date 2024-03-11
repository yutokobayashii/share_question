import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/usecase/cloud_firestore/cloud_firestore_usecase.dart';

import '../../entity/question_data/question.dart';

final cloudFireStoreNotifierProvider =
    NotifierProvider<CloudFireStoreNotifier, void>(CloudFireStoreNotifier.new);

class CloudFireStoreNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<String> saveQuestion(Map<String, dynamic> questionData) async {
    return await ref
        .read(cloudFireStoreUseCaseProvider)
        .saveQuestion(questionData);
  }

  Future<Question?> getQuestion(String documentId) async {
    return await ref
        .read(cloudFireStoreUseCaseProvider)
        .getQuestion(documentId);
  }

  Future<bool> deleteQuestion(String documentId) async {
    return await ref
        .read(cloudFireStoreUseCaseProvider)
        .deleteQuestion(documentId);
  }

  Future<void> incrementLikes(String documentId) async {
    await ref.read(cloudFireStoreUseCaseProvider).incrementLikes(documentId);
  }

  Future<String?> getDocumentIdByUuid(String uuid) async {
   return await ref.read(cloudFireStoreUseCaseProvider).getDocumentIdByUuid(uuid);
  }
  
  Future<void> incrementAnswerNumber(String documentId) async {
    await ref.read(cloudFireStoreUseCaseProvider).incrementAnswerNumber(documentId);
  }

  Future<List<Question>> getSortedQuestions() async {
    return await ref.read(cloudFireStoreUseCaseProvider).getSortedQuestions();
  }
}
