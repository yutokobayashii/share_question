import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../usecase/verify_purchase/verify_purchase_usecase.dart';

final verifyPurchaseNotifierProvider = NotifierProvider<VerifyPurchaseNotifier, void>(VerifyPurchaseNotifier.new);

class VerifyPurchaseNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<int> verifyPurchase(PurchaseDetails purchaseDetails) async {
    return await ref.read(verifyPurchaseUseCaseProvider).verifyPurchase(purchaseDetails);
  }
}