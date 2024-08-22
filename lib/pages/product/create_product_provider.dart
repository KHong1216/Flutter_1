import 'package:flutter_project1/models/product/product.dart';
import 'package:flutter_project1/repositories/product/product_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_product_provider.g.dart';

@riverpod
class CreateProduct extends _$CreateProduct {
  @override
  FutureOr<void> build() {}

  Future<void> create({
    required Product product,
  }) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(
      () => ref.read(productRepositoryProvider).createProduct(product: product),
    );
  }
}
