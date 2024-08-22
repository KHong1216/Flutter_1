import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    @Default('') String id,
    @Default('') String name,
    @Default('') String email,
    @Default([]) List<String> chatId,
    @Default([]) List<String> favoriteProduct,
    @Default([]) List<String> favoriteCommunity,
  }) = _AppUser;

  factory AppUser.fromDoc(DocumentSnapshot appUserDoc) {
    final appUserData = appUserDoc.data() as Map<String, dynamic>;
    final chatSnapshot = (appUserData['chatId'] as List<dynamic>)
        .map((id) => id as String)
        .toList();
    final productSnapshot = (appUserData['favoriteProduct'] as List<dynamic>)
        .map((id) => id as String)
        .toList();
    final communitySnapshot = (appUserData['favoriteProduct'] as List<dynamic>)
        .map((id) => id as String)
        .toList();

    return AppUser(
      id: appUserDoc.id,
      name: appUserData['name'],
      email: appUserData['email'],
      chatId: chatSnapshot,
      favoriteProduct: productSnapshot,
      favoriteCommunity: communitySnapshot,
    );
  }
}
