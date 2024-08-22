// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityImpl _$$CommunityImplFromJson(Map<String, dynamic> json) =>
    _$CommunityImpl(
      uid: json['uid'] as String? ?? '',
      writer: json['writer'] as String? ?? '',
      name: json['name'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      region: json['region'] as String? ?? '',
      viewCount: json['viewCount'] as String? ?? '',
      goodCount: json['goodCount'] as String? ?? '',
      commentCount: json['commentCount'] as String? ?? '',
      comment: (json['comment'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CommunityImplToJson(_$CommunityImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'writer': instance.writer,
      'name': instance.name,
      'desc': instance.desc,
      'region': instance.region,
      'viewCount': instance.viewCount,
      'goodCount': instance.goodCount,
      'commentCount': instance.commentCount,
      'comment': instance.comment,
    };
