



import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class GradeSqFliteDB {
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
    final path = join(documentsDirectory.path, "grade.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future _onCreate(Database db, int version) async {

    await db.execute('''
    CREATE TABLE Grades(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT
    )
  ''');

  }
}
