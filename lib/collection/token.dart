import 'package:isar/isar.dart';

part 'token.g.dart';

@collection
class Token {
  Id id = Isar.autoIncrement;

  late String token;

  late String questionName;

  late String author;

  late DateTime createdAt;

  late String explain;
}