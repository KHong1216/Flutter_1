import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/community/comment.dart';
import 'package:flutter_project1/models/community/community.dart';
import 'package:flutter_project1/repositories/handle_exception.dart';

class CommunityRepository {
  int id = 1;

  Future<void> fetchingId() async {
    int idCount = 1;
    QuerySnapshot snapshot = await communityCollection.get();
    List<int> ids = snapshot.docs.map((e) => int.parse(e.id)).toList();
    ids.sort();
    for (var fetchId in ids) {
      if (fetchId == idCount) {
        idCount++;
      }
    }
    id = idCount;
  }

  Future<void> createPost({required Community community}) async {
    try {
      await fetchingId();
      await communityCollection.doc(id.toString()).set(community.toJson());
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Community> getCommunity({required String postId}) async {
    try {
      final DocumentSnapshot communityDoc =
          await communityCollection.doc(postId).get();

      if (communityDoc.exists) {
        final community = Community.fromDoc(communityDoc);
        return community;
      }
      throw 'Post not found';
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updateCommunity(
      {required String postId, required updateContent}) async {
    try {
      final DocumentSnapshot communityDoc =
          await communityCollection.doc(postId).get();
      int count = 0;
      final communityData = communityDoc.data() as Map<String, dynamic>;
      if (updateContent == 'view') {
        final data = communityData['viewCount'].toString();
        count = int.parse(data);
        count++;
        await communityCollection
            .doc(postId)
            .update({'viewCount': count.toString()});
      } else if (updateContent == 'good') {
        final data = communityData['goodCount'].toString();
        count = int.parse(data);
        count++;
        await communityCollection
            .doc(postId)
            .update({'goodCount': count.toString()});
      } else if (updateContent == 'comment') {
        final data = communityData['commentCount'].toString();
        count = int.parse(data);
        count++;
        await communityCollection
            .doc(postId)
            .update({'commentCount': count.toString()});
      }
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> createComment(
      {required String postId, required Comment comment}) async {
    try {
      final snapshot = await communityCollection.doc(postId).get();
      if (snapshot.exists) {
        final data = Community.fromDoc(snapshot);
        final comments = List<Comment>.from(data.comment);
        comments.add(comment);
        await communityCollection
            .doc(postId)
            .update({'comment': comments.map((e) => e.toJson()).toList()});
      }
    } catch (e) {
      throw handleException(e);
    }
  }
}
