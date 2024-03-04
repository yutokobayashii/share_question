import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../collection/token/token.dart';
import '../../data/local/token_isar_dao.dart';

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepositoryImpl(dao: TokenDao());
});

abstract class TokenRepository {
  Future<List<Token>> tokenFindAll();

  Future<void> deleteTokenData(int id);

  Future<void> putTokenData(Token token);
}

class TokenRepositoryImpl implements TokenRepository {
  @visibleForTesting
  TokenRepositoryImpl({
    required TokenDao dao,
  }) : _dao = dao;

  final TokenDao _dao;

  @override
  Future<void> deleteTokenData(int id) async {
    await _dao.deleteTokenData(id);
  }

  @override
  Future<void> putTokenData(Token token) async {
    await _dao.putTokenData(token);
  }

  @override
  Future<List<Token>> tokenFindAll() async {
    return await _dao.tokenFindAll();
  }
}
