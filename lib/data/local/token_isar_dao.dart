


import 'package:isar/isar.dart';


import '../../collection/token/token.dart';
import '../../db/isar_db.dart';

class TokenDao {


  static Future<List<Token>> tokenFindAll() async {
    final isar = IsarDB.getInstance();

    final list = await isar.tokens.where().findAll();

    return list;
  }


  Future<void> deleteTokenData(int id) async {
    final isar = IsarDB.getInstance();
    await isar.writeTxn(() async {
      await isar.tokens.delete(id);
    });
  }

  Future<void> putTokenData(Token token) async {
    final isar = IsarDB.getInstance();

    await isar.writeTxn(() async {
      await isar.tokens.put(token);
    });
  }
}