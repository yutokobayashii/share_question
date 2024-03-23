import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../constant/billing.dart';

class VerifyPurchaseService {
  Future<int> verifyPurchase(PurchaseDetails purchaseDetails) async {
    try {
      if (Platform.isIOS) {
        HttpsCallable verifyReceipt = FirebaseFunctions.instanceFor(region: 'asia-northeast1').httpsCallable('verifyIos');
        final HttpsCallableResult result = await verifyReceipt.call(
            {'data': purchaseDetails.verificationData.localVerificationData});

        debugPrint("Verify Purchase RESULT: ${result.data}");
        return result.data[BillingConst.result];
      } else if (Platform.isAndroid) {
        HttpsCallable verifyReceipt = FirebaseFunctions.instanceFor(region: 'asia-northeast1').httpsCallable('verifyAndroid');
        final HttpsCallableResult result = await verifyReceipt.call({
          'data': purchaseDetails.verificationData.localVerificationData});

        debugPrint("Verify Purchase RESULT: ${result.data}");
        return result.data[BillingConst.result];
      }
      debugPrint("_verifyPurchase not matching OS");
      return BillingConst.UNEXPECTED_ERROR;
    } catch (error) {
      debugPrint('_verifyPurchase error: $error');
      return BillingConst.UNEXPECTED_ERROR;
    }
  }
}

