import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/repositories/handle_exception.dart';

class ProfileRepository {
  Future<AppUser> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot appUserDoc = await userCollection.doc(uid).get();

      if (appUserDoc.exists) {
        final appUser = AppUser.fromDoc(appUserDoc);
        return appUser;
      }
      throw 'User not found';
    } catch (e) {
      throw handleException(e);
    }
  }
}
