import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../data/remote/verify_purchase_service.dart';

final verifyPurchaseRepositoryProvider = Provider<VerifyPurchaseRepository>((ref) {
  return VerifyPurchaseRepositoryImpl(service: VerifyPurchaseService());
});

abstract class VerifyPurchaseRepository {
  Future<int> verifyPurchase(PurchaseDetails purchaseDetails);
}

class VerifyPurchaseRepositoryImpl implements VerifyPurchaseRepository {
  @visibleForTesting
  VerifyPurchaseRepositoryImpl({
    required VerifyPurchaseService service,
  }) : _service = service;

  final VerifyPurchaseService _service;

  @override
  Future<int> verifyPurchase(PurchaseDetails purchaseDetails) async {
    return await _service.verifyPurchase(purchaseDetails);
  }
}
