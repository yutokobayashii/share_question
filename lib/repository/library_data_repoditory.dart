
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/local/question_sqflite_dao.dart';
import '../entity/question_data/question.dart';

final libraryDataProvider = FutureProvider<List<Question>>((ref) async {
  final data = LibraryDataRepositoryImp();
  return await data.getQuestion(); // ここは Future<List<Question>> を返します
});

abstract class LibraryDataRepository {
  Future<List<Question>> getQuestion();
}

class LibraryDataRepositoryImp implements LibraryDataRepository {
  @override
  Future<List<Question>> getQuestion() async {


    final questionSqfliteDao = QuestionSqfliteDao();

    final list = questionSqfliteDao.getAllQuestionsFromDatabase();

    return list;
  }
}