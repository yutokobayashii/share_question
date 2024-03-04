import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../collection/token/token.dart';
import '../../repository/token/token_repository.dart';

final tokenUseCaseProvider = Provider((ref) {
  return TokenUseCaseImpl(repository: ref.read(tokenRepositoryProvider));
});

abstract class TokenUseCase {
  Future<List<Token>> tokenFindAll();

  Future<void> deleteTokenData(int id);

  Future<void> putTokenData(Token token);
}

class TokenUseCaseImpl implements TokenUseCase {
  @visibleForTesting
  TokenUseCaseImpl({
    required TokenRepository repository,
  }) : _repository = repository;

  final TokenRepository _repository;

  @override
  Future<void> deleteTokenData(int id) async {
    await _repository.deleteTokenData(id);
  }

  @override
  Future<void> putTokenData(Token token) async {
    await _repository.putTokenData(token);
  }

  @override
  Future<List<Token>> tokenFindAll() async {
    return await _repository.tokenFindAll();
  }
}
