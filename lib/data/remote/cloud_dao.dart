import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../constant/error.dart';
import '../../entity/question_data/question.dart';

class CloudDao {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> saveQuestion(Map<String, dynamic> questionData) async {
    // Firestoreにデータを保存
    DocumentReference docRef =
        await fireStore.collection('questionList').add(questionData);

    return docRef.id;
  }

  Future<Question?> getQuestion(String documentId) async {
    try {
      DocumentSnapshot docSnapshot =
          await fireStore.collection('questionList').doc(documentId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return Question.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(getFirebaseError);
    }
  }

  Future<bool> deleteQuestion(String documentId) async {
    try {
      await fireStore.collection('questionList').doc(documentId).delete();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> incrementAnswerNumber(String documentId) async {
    try {
      DocumentReference docRef =
      fireStore.collection('questionList').doc(documentId);

      await docRef.update({'answerNumber': FieldValue.increment(1)});
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Firebase increment error');
    }
  }

  Future<void> incrementLikes(String documentId) async {
    try {
      DocumentReference docRef =
          fireStore.collection('questionList').doc(documentId);

      await docRef.update({'favorite': FieldValue.increment(1)});
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Firebase increment error');
    }
  }

  Future<String?> getDocumentIdByUuid(String uuid) async {
    try {
      QuerySnapshot querySnapshot = await fireStore
          .collection('questionList')
          .where('uuid', isEqualTo: uuid)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id; // これが一致するドキュメントのdocumentId
      } else {
        return null; // 一致するドキュメントが見つからない場合
      }
    } catch (e) {
      debugPrint(e.toString());
      return null; // エラーが発生した場合
    }
  }


  Future<List<Question>> getSortedQuestions() async {
    List<Question> questions = [];
    String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId != null) {
      var collection = FirebaseFirestore.instance.collection('questionList');
      var querySnapshot = await collection
          .where('userId', isEqualTo: currentUserId)
          // .orderBy('createdAt', descending: true) // 最新のものからソート
          .get();

      for (var doc in querySnapshot.docs) {
        Question question = Question.fromJson(doc.data());
        questions.add(question);
      }
    }

    return questions;
  }

}
