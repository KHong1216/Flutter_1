import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default('') String name,
    @Default('') String price,
    @Default('') String desc,
    @Default('') String region,
    @Default('') String uid,
    @Default('') String userName,
    @Default('') String chatCount,
    @Default('') String favoriteCount,
    // 이미지 추가해야함
  }) = _Product;

  factory Product.fromDoc(DocumentSnapshot productDoc) {
    final productData = productDoc.data() as Map<String, dynamic>;

    return Product(
        name: productData['name'],
        price: productData['product'],
        desc: productData['desc'],
        region: productData['region'],
        uid: productData['uid'],
        userName: productData['userName'],
        chatCount: productData['chatCount'],
        favoriteCount: productData['sellUser']);
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
