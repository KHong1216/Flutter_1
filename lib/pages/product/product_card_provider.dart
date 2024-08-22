import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/repositories/product/product_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_card_provider.g.dart';

@riverpod
class ProductFavorite extends _$ProductFavorite {
  @override
  FutureOr<void> build() {}

  Future<void> favorite({required String productId}) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => ref
        .read(productRepositoryProvider)
        .favoriteProduct(productId: productId));
  }

  Future<void> unFavorite({required String productId}) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => ref
        .read(productRepositoryProvider)
        .unfavoriteProduct(productId: productId));
  }
}

@riverpod
FutureOr<DocumentSnapshot> getProductDoc(GetProductDocRef ref, String id) {
  return productCollection.doc(id).get();
}
