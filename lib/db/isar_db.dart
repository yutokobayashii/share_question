
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';


import '../collection/token.dart';

class IsarDB {
  static final IsarDB _instance = IsarDB._init();
  Isar? _database;

  IsarDB._init();

  // 初期化メソッド
  static Future<void> init() async {
    if (_instance._database == null) {
      final dir = await getApplicationDocumentsDirectory();
      _instance._database = await Isar.open(
        [
          TokenSchema,
        ],
        directory: dir.path,
      );
    }
  }

  static Isar getInstance () {
    if (_instance._database == null) {
      init();
    }
    return _instance._database!;
  }


}
