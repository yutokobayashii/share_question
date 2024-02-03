import 'dart:convert';

import '../../db/grade_sq_flite_db.dart';
import '../../entity/grade_data/grade.dart';

class GradeSqfliteDao {
  String _serializeGrade(Grade grade) {
    return jsonEncode(grade.toJson());
  }

  Grade _deserializeGrade(String json) {
    return Grade.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  // データベースへの保存
  Future<int> addGradeToDatabase(Grade grade) async {
    final db = await GradeSqFliteDB.database;
    final questionJson = _serializeGrade(grade);
    return await db.insert('Grades', {'data': questionJson});
  }

  // データベースからの読み取り（単一のQuestion）
  Future<Grade> getGradeFromDatabase(int id) async {
    final db = await GradeSqFliteDB.database;
    final maps = await db.query('Grades', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return _deserializeGrade(maps.first['data'] as String);
    }
    throw Exception('Grade not found');
  }

  Future<List<Grade>> getAllGradesFromDatabase() async {
    final db = await GradeSqFliteDB.database;
    final maps = await db.query('Grades');
    if (maps.isNotEmpty) {
      return maps
          .map((map) => _deserializeGrade(map['data'] as String))
          .toList();
    }
    return []; // 空のリストを返すか、エラーを投げるかは要件に応じて選択
  }
}
