import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}

@riverpod
Stream<User?> authStateStream(AuthStateStreamRef ref) {
  return fbAuth.authStateChanges();
}
