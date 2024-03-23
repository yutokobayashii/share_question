
import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
class GetProductService {

  Future<List<ProductDetails>> getProducts(InAppPurchase inAppPurchase) async {

    final bool available = await inAppPurchase.isAvailable();

    List<ProductDetails> products = [];

    if (!available) {
      return products;
    }

    final ids = <String>{ 'com.share.question'};
    final ProductDetailsResponse response = await inAppPurchase.queryProductDetails(ids);

    if (response.error != null) {
      debugPrint('getProducts response error : ${response.error!.message}');
      return products;
    }

    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('getProducts response.notFoundIDs.isNotEmpty: ${response.notFoundIDs}');
      products = [];
    } else {
      products = response.productDetails;
    }
    return products;
  }
}



