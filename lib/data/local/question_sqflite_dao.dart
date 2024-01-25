


import 'dart:convert';

import '../../db/sq_flite_db.dart';
import '../../entity/question_data/question.dart';

class QuestionSqfliteDao {

  String _serializeQuestion(Question question) {
    return jsonEncode(question.toJson());
  }

  Question _deserializeQuestion(String json) {
    return Question.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  // データベースへの保存
  Future<int> addQuestionToDatabase(Question question) async {
    final db = await SqFliteDB.database;
    final questionJson = _serializeQuestion(question);
    return await db.insert('Questions', {'data': questionJson});
  }

// データベースからの読み取り
  Future<Question> getQuestionFromDatabase(int id) async {
    final db = await SqFliteDB.database;
    final maps = await db.query('Questions', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return _deserializeQuestion(maps.first['data'] as String);
    }
    throw Exception('Question not found');
  }


  Future<void> deleteQuestion(int id) async {
    final db = await SqFliteDB.database;
    await db.delete(
      'Questions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
