
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../collection/token/token.dart';
import '../../usecase/token/token_usecase.dart';

final tokenNotifierProvider = NotifierProvider<TokenNotifier, void>(TokenNotifier.new);

class TokenNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<List<Token>> tokenFindAll() async {
   return await ref.read(tokenUseCaseProvider).tokenFindAll();
  }

  Future<void> deleteTokenData(int id) async {
    await ref.read(tokenUseCaseProvider).deleteTokenData(id);
  }

  Future<void> putTokenData(Token token) async {
    await ref.read(tokenUseCaseProvider).putTokenData(token);
  }
}