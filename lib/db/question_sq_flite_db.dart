

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class QuestionSqFliteDB {
  static Database? _database;

  static Future<void> init() async {
    _database = await _initDB();
  }

  static Future<Database> get database async {
    if (_database != null) return _database!;
    throw Exception('Database not initialized');
  }

  static Future<Database> _initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "my_database.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future _onCreate(Database db, int version) async {

    await db.execute('''
    CREATE TABLE Questions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT
    )
  ''');

  }
}
