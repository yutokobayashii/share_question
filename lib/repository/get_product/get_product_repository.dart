import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../data/remote/get_product_service.dart';

final getProductRepositoryProvider = Provider<GetProductRepository>((ref) {
  return GetProductRepositoryImpl(service: GetProductService());
});

abstract class GetProductRepository {
  Future<List<ProductDetails>> getProducts(InAppPurchase inAppPurchase);
}

class GetProductRepositoryImpl implements GetProductRepository {
  @visibleForTesting
  GetProductRepositoryImpl({
    required GetProductService service,
  }) : _service = service;

  final GetProductService _service;

  @override
  Future<List<ProductDetails>> getProducts(InAppPurchase inAppPurchase) async {
    return await _service.getProducts(inAppPurchase);
  }
}
