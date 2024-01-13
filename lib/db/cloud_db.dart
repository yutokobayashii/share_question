

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB {

  Future<String> saveQuestion(Map<String, dynamic> questionData) async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    // Firestoreにデータを保存
    DocumentReference docRef = await fireStore.collection('questionList').add(questionData);

    return docRef.id;
  }

}


