import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/question_sqflite_dao.dart';
import '../entity/question_data/question.dart';

final libraryDataProvider = FutureProvider.family<List<Question>, int>((ref, idData) async {
  final data = LibraryDataRepositoryImp();
  return await data.getQuestion(idData); // ここは Future<List<Question>> を返します
});

abstract class LibraryDataRepository {
  Future<List<Question>> getQuestion(int idData);
}

class LibraryDataRepositoryImp implements LibraryDataRepository {
  @override
  Future<List<Question>> getQuestion( int idData) async {


    final questionSqfliteDao = QuestionSqfliteDao();

    List<Question> questionList = [];

    for(int i = 0; i<idData; i++) {
      try {
        final list = await questionSqfliteDao.getQuestionFromDatabase(i + 1);
        questionList.add(list);
      } catch (e) {
        debugPrint('Error getting question from database: $e');
      }

    }

    debugPrint('ここを確認したい$questionList');
    return questionList;
  }
}