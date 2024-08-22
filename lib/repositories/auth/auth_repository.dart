import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/repositories/handle_exception.dart';

class AuthRepository {
  User? get currentUser => fbAuth.currentUser;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
          email: email, password: password); //회원가입

      final signedUser = userCredential.user!; //회원가입된 유저
      await userCollection.doc(signedUser.uid).set({
        'name': name,
        'email': email,
        'chatId': List.empty(),
        'favoriteProduct': List.empty(),
        'favoriteCommunity': List.empty(),
      }); //유저doc설정
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateChatId({required String chatId}) async {
    try {
      List<String> chatList = [];
      chatList.add(chatId);
      await userCollection
          .doc(fbAuth.currentUser!.uid)
          .update({'chatId': chatList});
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateFavotireProduct({required String productId}) async {
    try {
      List<String> productList = [];
      productList.add(productId);
      await userCollection
          .doc(fbAuth.currentUser!.uid)
          .update({'favoriteProduct': productList});
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateFavotireCommunity({required String commuityId}) async {
    try {
      List<String> communityList = [];
      communityList.add(commuityId);
      await userCollection
          .doc(fbAuth.currentUser!.uid)
          .update({'favoriteCommunity': communityList});
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    try {
      await fbAuth.signInWithEmailAndPassword(
          email: email, password: password); //로그인
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> signout() async {
    try {
      await fbAuth.signOut(); //로그아웃
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> changePassword(String password) async {
    try {
      await currentUser!.updatePassword(password); //패스워드 변경
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await fbAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await currentUser!.sendEmailVerification();
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> reloadUer() async {
    try {
      await currentUser!.reload();
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> reauthenticateWithCredential(
      String email, String password) async {
    try {
      await currentUser!.reauthenticateWithCredential(
          EmailAuthProvider.credential(email: email, password: password));
    } catch (e) {
      throw handleException(e);
    }
  }
}
