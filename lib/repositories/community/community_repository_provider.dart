import 'package:flutter_project1/repositories/community/community_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_repository_provider.g.dart';

@riverpod
CommunityRepository communityRepository(CommunityRepositoryRef ref) {
  return CommunityRepository();
}
