import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/community/community.dart';
import 'package:flutter_project1/repositories/community/community_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_post_provider.g.dart';

@riverpod
class CreatePost extends _$CreatePost {
  @override
  FutureOr<void> build() {}

  Future<void> create({
    required Community community,
  }) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() =>
        ref.read(communityRepositoryProvider).createPost(community: community));
  }
}
