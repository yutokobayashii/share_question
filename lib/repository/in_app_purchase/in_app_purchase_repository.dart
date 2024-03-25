import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/remote/in_app_purchase_service.dart';

final inAppPurchaseRepositoryProvider = Provider((ref) {
  return InAppPurchaseRepositoryImpl(service: InAppPurchaseService());
});

abstract class InAppPurchaseRepository {
  Future<void> initInAppPurchase(String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback subscriptionDoneAction);

  Future<void> makePurchase(String offeringsName, String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback errorAction,VoidCallback successAction);

  Future<void> restorePurchase(String entitlement, VoidCallback onRestoreNoPurchase, VoidCallback onRestoreActiveSubscription, VoidCallback onRestoreExpiredSubscription, VoidCallback onRestoreFail,VoidCallback noInfoAction,);
}

class InAppPurchaseRepositoryImpl implements InAppPurchaseRepository {
  @visibleForTesting
  InAppPurchaseRepositoryImpl({
    required InAppPurchaseService service,
  }) : _service = service;

  final InAppPurchaseService _service;

  @override
  Future<void> initInAppPurchase(String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback subscriptionDoneAction) async {
    await _service.initInAppPurchase(userId,freeAction,payedAction,subscriptionDoneAction);
  }

  @override
  Future<void> makePurchase(String offeringsName, String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback errorAction,VoidCallback successAction) async {
    await _service.makePurchase(offeringsName, userId,freeAction,payedAction,errorAction,successAction);
  }

  @override
  Future<void> restorePurchase(String entitlement, VoidCallback freeAction, VoidCallback payedAction, VoidCallback onRestoreSuccess, VoidCallback onRestoreFail,VoidCallback noInfoAction,) async {
    await _service.restorePurchase(entitlement,freeAction,payedAction,onRestoreSuccess,onRestoreFail,noInfoAction);
  }
}
