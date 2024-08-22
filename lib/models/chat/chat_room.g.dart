// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      chatId: json['chatId'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      writer: json['writer'] as String? ?? '',
      contact: json['contact'] as String? ?? '',
      contactName: json['contactName'] as String? ?? '',
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'uid': instance.uid,
      'writer': instance.writer,
      'contact': instance.contact,
      'contactName': instance.contactName,
      'messages': instance.messages,
    };
