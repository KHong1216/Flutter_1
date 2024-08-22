import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/models/custom_error.dart';

CustomError handleException(e) {
  try {
    throw e;
  } on FirebaseAuthException catch (e) {
    return CustomError(
      code: e.code,
      message: e.message ?? 'Invalid credential', //잘못된 자격
      plugin: e.plugin,
    );
  } on FirebaseException catch (e) {
    return CustomError(
      code: e.code,
      message: e.message ?? 'Firebase Error',
      plugin: e.plugin,
    );
  } catch (e) {
    return CustomError(
        code: 'Exception', message: e.toString(), plugin: 'Unknown Error');
  }
}
