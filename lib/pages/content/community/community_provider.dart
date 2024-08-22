import 'package:flutter_project1/models/community/community.dart';
import 'package:flutter_project1/repositories/community/community_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_provider.g.dart';

@riverpod
FutureOr<Community> communityProfile(CommunityProfileRef ref, String postId) {
  return ref.watch(communityRepositoryProvider).getCommunity(postId: postId);
}
