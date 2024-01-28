

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

  // データベースからの読み取り（単一のQuestion）
  Future<Question> getQuestionFromDatabase(int id) async {
    final db = await SqFliteDB.database;
    final maps = await db.query('Questions', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return _deserializeQuestion(maps.first['data'] as String);
    }
    throw Exception('Question not found');
  }

  // データベースからの読み取り（Questionのリスト）
  Future<List<Question>> getAllQuestionsFromDatabase() async {
    final db = await SqFliteDB.database;
    final maps = await db.query('Questions');
    if (maps.isNotEmpty) {
      return maps.map((map) => _deserializeQuestion(map['data'] as String)).toList();
    }
    return []; // 空のリストを返すか、エラーを投げるかは要件に応じて選択
  }

  Future<void> deleteQuestionByUuid(String uuid) async {
    final db = await SqFliteDB.database; // SqFliteDB.databaseはデータベースへの接続を提供する想定

    // QuestionsテーブルからすべてのQuestionデータを取得
    List<Map> questions = await db.query('Questions');

    for (Map question in questions) {
      // dataカラムからQuestionオブジェクトをデシリアライズ
      Map<String, dynamic> questionData = jsonDecode(question['data']);

      // 特定のuuidを持つQuestionを識別
      if (questionData['uuid'] == uuid) {
        // 該当するQuestionを削除
        await db.delete(
          'Questions',
          where: 'id = ?',
          whereArgs: [question['id']],
        );
      }
    }
  }

}
