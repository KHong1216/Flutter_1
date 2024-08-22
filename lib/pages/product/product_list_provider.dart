import 'package:flutter_project1/models/product/product.dart';
import 'package:flutter_project1/repositories/product/product_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_provider.g.dart';

@riverpod
FutureOr<Product> productProfile(ProductProfileRef ref, String id) {
  return ref.watch(productRepositoryProvider).getProduct(productId: id);
}
