

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/entity/initial_question/initial_question.dart';


import '../../collection/token/token.dart';
import '../../data/local/token_isar_dao.dart';




class ConfirmQuestionController {

  Future<void> putQuestionDataToIsar (String id,WidgetRef ref,InitialQuestion initial) async {

    final newToken = Token();
    final tokenDao = TokenDao();
    final now = DateTime.now();

    newToken.token = id;
    newToken.questionName = initial.name;
    newToken.author = initial.author;
    newToken.createdAt = "${now.year}/${now.month}/${now.day}";
    newToken.explain = initial.explain;


   await tokenDao.putTokenData(newToken);

  }




}


