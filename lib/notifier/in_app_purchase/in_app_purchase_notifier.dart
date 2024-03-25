
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/usecase/in_app_purchase/in_app_purchase_usecase.dart';

final inAppPurchaseNotifierProvider = NotifierProvider<InAppPurchaseNotifier, void>(InAppPurchaseNotifier.new);

class InAppPurchaseNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> initInAppPurchase(String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback subscriptionDoneAction) async {
   await ref.read(inAppPurchaseUseCaseProvider).initInAppPurchase(userId,freeAction,payedAction,subscriptionDoneAction);
  }

  Future<void> makePurchase(String offeringsName, String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback errorAction,VoidCallback successAction) async {
    await ref.read(inAppPurchaseUseCaseProvider).makePurchase(offeringsName, userId,freeAction,payedAction,errorAction,successAction);
  }

  Future<void> restorePurchase(String entitlement, VoidCallback freeAction, VoidCallback payedAction, VoidCallback onRestoreSuccess, VoidCallback onRestoreFail, VoidCallback noInfoAction) async {
    await ref.read(inAppPurchaseUseCaseProvider).restorePurchase(entitlement,freeAction,payedAction,onRestoreSuccess,onRestoreFail,noInfoAction);
  }
}