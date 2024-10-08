import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_provider.g.dart';

@riverpod
class Signin extends _$Signin {
  @override
  FutureOr<void> build() {}

  Future<void> signin({required String email, required String password}) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => ref
        .read(authRepositoryProvider)
        .signin(email: email, password: password));
  }
}
