

import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../collection/token/token.dart';
import '../../data/local/token_isar_dao.dart';
import '../../provider/initial_question_provider.dart';




class ConfirmQuestionController {

  Future<void> putQuestionDataToIsar (String id,WidgetRef ref) async {

    final newToken = Token();
    final tokenDao = TokenDao();
    final now = DateTime.now();

    newToken.token = id;
    newToken.questionName = ref.watch(InitialMakeQuestionProvider.questionNameProvider);
    newToken.author = ref.watch(InitialMakeQuestionProvider.authorProvider);
    newToken.createdAt = "${now.year}/${now.month}/${now.day}";
    newToken.explain = ref.watch(InitialMakeQuestionProvider.commentProvider);


   await tokenDao.putTokenData(newToken);

  }




}


