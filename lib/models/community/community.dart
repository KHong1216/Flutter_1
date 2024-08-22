import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/community/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  const factory Community(
      {@Default('') String uid,
      @Default('') String writer,
      @Default('') String name,
      @Default('') String desc,
      @Default('') String region,
      @Default('') String viewCount,
      @Default('') String goodCount,
      @Default('') String commentCount,
      @Default([]) List<Comment> comment}) = _Community;

  factory Community.fromDoc(DocumentSnapshot communityDoc) {
    List<Comment> comment = [];
    final commentSnapshot = List<Map>.from(communityDoc['comment'] as List);
    final communityData = communityDoc.data() as Map<String, dynamic>;
    for (var e in commentSnapshot) {
      comment.add(Comment.fromJson(e as Map<String, dynamic>));
    }

    return Community(
        uid: communityData['uid'],
        writer: communityData['writer'],
        name: communityData['name'],
        desc: communityData['desc'],
        region: communityData['region'],
        viewCount: communityData['viewCount'],
        goodCount: communityData['goodCount'],
        commentCount: communityData['commentCount'],
        comment: comment);
  }

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
