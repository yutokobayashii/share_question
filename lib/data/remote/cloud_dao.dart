

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../constant/error.dart';
import '../../entity/question_data/question.dart';

class CloudDao {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> saveQuestion(Map<String, dynamic> questionData) async {

    // Firestoreにデータを保存
    DocumentReference docRef = await fireStore.collection('questionList').add(questionData);

    return docRef.id;
  }



  Future<Question?> getQuestion(String documentId) async {
    try {
      DocumentSnapshot docSnapshot = await fireStore.collection('questionList').doc(documentId).get();

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

  Future<void> incrementLikes(String documentId) async {
    try {
      DocumentReference docRef = fireStore.collection('questionList').doc(documentId);

      await docRef.update({
        'favorite': FieldValue.increment(1)
      });
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Firebase increment error');
    }
  }

}


