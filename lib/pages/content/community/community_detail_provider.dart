import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/community/comment.dart';
import 'package:flutter_project1/repositories/community/community_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'community_detail_provider.g.dart';

@riverpod
class CreateComment extends _$CreateComment {
  @override
  FutureOr<void> build() {}

  Future<void> create(
      {required String postId, required Comment comment}) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => ref
        .read(communityRepositoryProvider)
        .createComment(postId: postId, comment: comment));
  }
}

@riverpod
Stream<DocumentSnapshot> getCommunityDoc(GetCommunityDocRef ref, String id) {
  return communityCollection.doc(id).snapshots();
}
