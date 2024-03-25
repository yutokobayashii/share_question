import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class InAppPurchaseService {
  bool isSubscribed = false;
  late Offerings offerings;

  Future<void> initInAppPurchase(String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback subscriptionDoneAction) async {
    try {
      late PurchasesConfiguration configuration;

      if (Platform.isAndroid) {
        // configuration = PurchasesConfiguration(Android用のRevenuecat APIキー);
      } else if (Platform.isIOS) {
        configuration =
            PurchasesConfiguration("appl_lBjTJOSpXgNrvCDZOLCynELPkqf");
      }
      await Purchases.configure(configuration);
      //offeringsを取ってくる
      offerings = await Purchases.getOfferings();
      //firebaseのidと、revenuecatのuserIdを一緒にしている場合、firebaseAuthのuidでログイン

      final result = await Purchases.logIn(userId);

      await getPurchaserInfo(result.customerInfo,freeAction,payedAction);

      final isAlreadyPayedMember = result.customerInfo.entitlements.all["default"]?.isActive ?? false;

      if (isAlreadyPayedMember) {
        payedAction();
        subscriptionDoneAction();
      } else {
        freeAction();
      }

      //今アクティブになっているアイテムは以下のように取得可能
      debugPrint("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");
    } catch (e) {
      debugPrint("initInAppPurchase error caught! ${e.toString()}");
    }
  }

  Future<void> getPurchaserInfo(CustomerInfo customerInfo,VoidCallback freeAction,VoidCallback payedAction) async {
    try {
      isSubscribed = await updatePurchases(customerInfo, "default"); //monthly_subscriptionは、適宜ご自身のentitlement名に変えてください
    } on PlatformException catch (e) {
      debugPrint(" getPurchaserInfo error ${e.toString()}");
    }
  }

  Future<bool> updatePurchases(
      CustomerInfo purchaserInfo, String entitlement) async {
    var isPurchased = false;
    final entitlements = purchaserInfo.entitlements.all;
    if (entitlements.isEmpty) {
      isPurchased = false;
    }
    if (!entitlements.containsKey(entitlement)) {
      ///そもそもentitlementが設定されて無い場合
      isPurchased = false;

    } else if (entitlements[entitlement]!.isActive) {
      ///設定されていて、activeになっている場合
      isPurchased = true;
    } else {
      isPurchased = false;
    }
    return isPurchased;

  }


  Future<void> makePurchase(String offeringsName,String userId,VoidCallback freeAction,VoidCallback payedAction,VoidCallback errorAction,VoidCallback successAction) async {
    try {
      Package? package;
      package = offerings.all[offeringsName]?.monthly;//offeringsは適宜ご自身の設定したofferingsの名前に変えてください
      if (package != null) {
        await Purchases.logIn(userId);
        CustomerInfo customerInfo = await Purchases.purchasePackage(package);
        await getPurchaserInfo(customerInfo,freeAction,payedAction);
        successAction();
      }
    } on PlatformException catch (e) {
      debugPrint(" makePurchase error ${e.toString()}");
      errorAction();
    }
  }

  Future<void> restorePurchase(
      String entitlement,
      VoidCallback freeAction,
      VoidCallback payedAction,
      VoidCallback onRestoreSuccess,
      VoidCallback onRestoreFail,
      VoidCallback noInfoAction,
      ) async {
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();
      final isActive = await updatePurchases(customerInfo, entitlement);
      if (!isActive) {
        debugPrint("購入情報なし");
        noInfoAction();
      } else {
        await getPurchaserInfo(customerInfo, freeAction, payedAction);
        debugPrint("$entitlement 購入情報あり　復元する");
        onRestoreSuccess();
      }
    } on PlatformException catch (e) {
      debugPrint("purchase repo  restorePurchase error ${e.toString()}");
      onRestoreFail();
    }
  }


}
