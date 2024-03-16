import 'package:cloud_firestore/cloud_firestore.dart';

class InquireCloudDao {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> sendInquire(Map<String, dynamic> inquireData) async {
    // Firestoreにデータを保存
    DocumentReference docRef =
    await fireStore.collection('inquireList').add(inquireData);

    return docRef.id;
  }
}