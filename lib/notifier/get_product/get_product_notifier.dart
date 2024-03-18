import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../usecase/get_product/get_product_usecase.dart';

final getProductNotifierProvider = NotifierProvider<GetProductNotifier, void>(GetProductNotifier.new);

class GetProductNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<List<ProductDetails>> getProducts(InAppPurchase inAppPurchase) async {
    return await ref.read(getProductUseCaseProvider).getProducts(inAppPurchase);
  }
}