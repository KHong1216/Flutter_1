// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      content: json['content'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'uid': instance.uid,
      'userName': instance.userName,
      'createdAt': instance.createdAt,
    };
