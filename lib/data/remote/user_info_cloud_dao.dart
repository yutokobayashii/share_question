import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoCloudDao {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> sendUserInfo(Map<String, dynamic> userInfo) async {
    // Firestoreにデータを保存
    DocumentReference docRef =
    await fireStore.collection('userInfo').add(userInfo);

    return docRef.id;
  }
}