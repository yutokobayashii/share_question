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
    final gradeJson = _serializeGrade(grade);
    // 'uuid'カラムにGradeのuuidを含めて挿入
    return await db.insert('Grades', {'uuid': grade.uuid, 'data': gradeJson});
  }

  //データベースの更新
  Future<int> updateGradeToDatabase(Grade grade) async {
    final db = await GradeSqFliteDB.database;
    final gradeJson = _serializeGrade(grade); // GradeをJSON形式に変換
    // 'Grades'テーブルの対応する行を更新
    return await db.update(
      'Grades',
      {'data': gradeJson},
      where: 'uuid = ?', // WHERE句を使用して更新する行を特定
      whereArgs: [grade.uuid], // where句のプレースホルダにバインドする値
    );
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

  Future<bool> isGradeExistsInDatabase(String uuid) async {
    final db = await GradeSqFliteDB.database;

    // 指定されたuuidを持つレコードがデータベースに存在するか確認
    final List<Map<String, dynamic>> existing = await db.query(
      'Grades',
      where: 'uuid = ?',
      whereArgs: [uuid],
    );

    // レコードが存在する場合はtrue、存在しない場合はfalseを返す
    return existing.isNotEmpty;
  }
}
