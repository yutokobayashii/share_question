

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../provider/initial_question_provider.dart';
import '../../provider/make_question_provider.dart';



class ConfirmQuestionController {

  Map<String, dynamic> createQuestionData(WidgetRef ref) {
    final questionDetailList  =  ref.watch(MakeQuestionProvider.questionDetailListProvider);
    return {
      'name': ref.watch(InitialMakeQuestionProvider.questionNameProvider),
      'author': ref.watch(InitialMakeQuestionProvider.authorProvider),
      'explain': ref.watch(InitialMakeQuestionProvider.explainProvider),
      'comment': ref.watch(InitialMakeQuestionProvider.commentProvider),
      'questionDetailList': [

        for(int i = 0; i< questionDetailList.length; i++) ...{
          {
            'isOptional': questionDetailList[i].isOptional,
            'questionName': questionDetailList[i].questionName,
            'image': questionDetailList[i].image,
            'correctAnswer': questionDetailList[i].correctAnswer,
            'explanation': questionDetailList[i].explanation,
            'optionalList': [
              for(int i2 = 0; i2< questionDetailList[i].optionalList.length; i2++) ...{
                {'optional': questionDetailList[i].optionalList[i2].optional},
              }

              // 他のOptionalQuestion...
            ],
          },
        }
      ],
    };
  }

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
    } catch (e) {
      // エラー発生時の処理
      debugPrint("アップロードまたはURL取得中にエラーが発生しました: $e");
      return ''; // エラーが発生した場合は空文字を返すか、エラーを投げる
    }
  }



}


