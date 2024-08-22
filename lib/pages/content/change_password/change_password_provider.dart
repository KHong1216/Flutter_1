import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_provider.g.dart';

@riverpod
class ChangePassword extends _$ChangePassword {
  @override
  FutureOr<void> build() {}

  Future<void> changePassword({required String password}) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(
        () => ref.read(authRepositoryProvider).changePassword(password));
  }
}
