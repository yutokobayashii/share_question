import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../repository/verify_purchase/verify_purchase_repository.dart';

final verifyPurchaseUseCaseProvider = Provider<VerifyPurchaseUseCase>((ref) {
  return VerifyPurchaseUseCaseImpl(repository: ref.read(verifyPurchaseRepositoryProvider));
});

abstract class VerifyPurchaseUseCase {
  Future<int> verifyPurchase(PurchaseDetails purchaseDetails);
}

class VerifyPurchaseUseCaseImpl implements VerifyPurchaseUseCase {
  @visibleForTesting
  VerifyPurchaseUseCaseImpl({
    required VerifyPurchaseRepository repository,
  }) : _repository = repository;

  final VerifyPurchaseRepository _repository;

  @override
  Future<int> verifyPurchase(PurchaseDetails purchaseDetails) async {
    return await _repository.verifyPurchase(purchaseDetails);
  }
}
