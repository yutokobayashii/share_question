import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repository/in_app_purchase/in_app_purchase_repository.dart';

final inAppPurchaseUseCaseProvider = Provider((ref) {
  return InAppPurchaseUseCaseImpl(repository: ref.read(inAppPurchaseRepositoryProvider));
});

abstract class InAppPurchaseUseCase {
  Future<void> initInAppPurchase(String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback subscriptionDoneAction);

  Future<void> makePurchase(String offeringsName, String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback errorAction,VoidCallback successAction);

  Future<void> restorePurchase(String entitlement, VoidCallback onRestoreNoPurchase, VoidCallback onRestoreActiveSubscription, VoidCallback onRestoreExpiredSubscription, VoidCallback onRestoreFailVoidCallback , VoidCallback noInfoAction,);
}

class InAppPurchaseUseCaseImpl implements InAppPurchaseUseCase {
  @visibleForTesting
  InAppPurchaseUseCaseImpl({
    required InAppPurchaseRepository repository,
  }) : _repository = repository;

  final InAppPurchaseRepository _repository;

  @override
  Future<void> initInAppPurchase(String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback subscriptionDoneAction) async {
    await _repository.initInAppPurchase(userId,freeAction,payedAction,subscriptionDoneAction);
  }

  @override
  Future<void> makePurchase(String offeringsName, String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback errorAction,VoidCallback successAction) async {
    await _repository.makePurchase(offeringsName, userId,freeAction,payedAction,errorAction,successAction);
  }

  @override
  Future<void> restorePurchase(String entitlement, VoidCallback freeAction, VoidCallback payedAction, VoidCallback onRestoreSuccess, VoidCallback onRestoreFail,VoidCallback noInfoAction,) async {
    await _repository.restorePurchase(entitlement,freeAction,payedAction,onRestoreSuccess,onRestoreFail,noInfoAction);
  }
}
