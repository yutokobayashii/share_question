

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CloudDao {

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> saveQuestion(Map<String, dynamic> questionData) async {

    // Firestoreにデータを保存
    DocumentReference docRef = await fireStore.collection('questionList').add(questionData);

    return docRef.id;
  }



  Future<Map<String, dynamic>?> getQuestion(String documentId) async {
    try {
      DocumentSnapshot docSnapshot = await fireStore.collection('questionList').doc(documentId).get();

      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }



  Future<bool> deleteQuestion(String documentId) async {
    try {
      await fireStore.collection('questionList').doc(documentId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}


