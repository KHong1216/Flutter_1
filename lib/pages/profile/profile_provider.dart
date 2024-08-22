import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/repositories/profile/profile_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
FutureOr<AppUser> profile(ProfileRef ref, String uid) {
  return ref.watch(profileRepositoryProvider).getProfile(uid: uid);
}
