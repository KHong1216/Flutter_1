import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/product/product.dart';
import 'package:flutter_project1/repositories/handle_exception.dart';

class ProductRepository {
  String id = '1';
  String chat = '0';
  String favorite = '0';
  bool toggle = false;

  Future<void> fetchingId() async {
    int idCount = 1;
    QuerySnapshot snapshot =
        await productCollection.orderBy(FieldPath.documentId).get();
    List<int> ids = snapshot.docs.map((e) => int.parse(e.id)).toList();
    ids.sort();
    for (var fetchId in ids) {
      if (fetchId == idCount) {
        idCount++;
      }
    }
    id = idCount.toString();
  }

  Future<void> createProduct({
    required Product product,
  }) async {
    try {
      await fetchingId();
      await productCollection.doc(id.toString()).set(
            product.toJson(),
          );
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Product> getProduct({required String productId}) async {
    try {
      final DocumentSnapshot productDoc =
          await productCollection.doc(productId).get();

      if (productDoc.exists) {
        final product = Product.fromDoc(productDoc);
        return product;
      }
      throw 'Product not found';
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> favoriteProduct({required String productId}) async {
    try {
      final snapshot = await userCollection.doc(fbAuth.currentUser!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      final productList = data['favoriteProduct'] as List<dynamic>;
      productList.add(productId);
      await userCollection
          .doc(fbAuth.currentUser!.uid)
          .update({'favoriteProduct': productList});
      updateProduct(productId: productId, countContent: 'favorite');
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> unfavoriteProduct({required String productId}) async {
    try {
      final snapshot = await userCollection.doc(fbAuth.currentUser!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      final productList = data['favoriteProduct'] as List<dynamic>;
      productList.remove(productId);
      await userCollection
          .doc(fbAuth.currentUser!.uid)
          .update({'favoriteProduct': productList});
      updateProduct(productId: productId, countContent: 'unfavorite');
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateProduct(
      {required String productId, required String countContent}) async {
    try {
      final DocumentSnapshot productDoc =
          await productCollection.doc(productId).get();
      final productData = productDoc.data() as Map<String, dynamic>;
      int count = 0;

      if (countContent == 'chat') {
        final data = productData['chatCount'].toString();
        count = int.parse(data);
        count++;
        await productCollection
            .doc(productId)
            .update({'chatCount': count.toString()});
      } else if (countContent == 'favorite') {
        final data = productData['favoriteCount'].toString();
        count = int.parse(data);
        count++;
        await productCollection
            .doc(productId)
            .update({'favoriteCount': count.toString()});
      } else if (countContent == 'unfavorite') {
        final data = productData['favoriteCount'].toString();
        count = int.parse(data);
        count--;
        await productCollection
            .doc(productId)
            .update({'favoriteCount': count.toString()});
      }
    } catch (e) {
      throw handleException(e);
    }
  }
}
