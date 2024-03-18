import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../repository/get_product/get_product_repository.dart';

final getProductUseCaseProvider = Provider<GetProductUseCase>((ref) {
  return GetProductUseCaseImpl(repository: ref.read(getProductRepositoryProvider));
});

abstract class GetProductUseCase {
  Future<List<ProductDetails>> getProducts(InAppPurchase inAppPurchase);
}

class GetProductUseCaseImpl implements GetProductUseCase {
  @visibleForTesting
  GetProductUseCaseImpl({
    required GetProductRepository repository,
  }) : _repository = repository;

  final GetProductRepository _repository;

  @override
  Future<List<ProductDetails>> getProducts(InAppPurchase inAppPurchase) async {
    return await _repository.getProducts(inAppPurchase);
  }
}
