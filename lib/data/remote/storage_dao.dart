


import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class StorageDao {

  static Future<String> uploadImageToFirebase(XFile imageFile) async {
    try {
      File file = File(imageFile.path);
      String uuid = const Uuid().v4();

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('$uuid/image/${imageFile.name}');

      UploadTask uploadTask = ref.putFile(file);

      // アップロードの完了を待つ
      await uploadTask;

      // アップロードが完了した後にダウンロードURLを取得
      String downloadURL = await ref.getDownloadURL();

      return downloadURL;
    }  catch (e) {

        debugPrint("アップロードまたはURL取得中にエラーが発生しました: $e");
        return ''; // エラーが発生した場合は空文字を返すか、エラーを投げる
    }
  }


}

