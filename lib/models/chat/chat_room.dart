import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project1/models/chat/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    @Default('') String chatId,
    @Default('') String uid,
    @Default('') String writer,
    @Default('') String contact,
    @Default('') String contactName,
    @Default([]) List<Message> messages,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  factory ChatRoom.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final List<Message> message = [];
    final messageSnapshot = List<Map>.from(snapshot['messages'] as List);
    for (var e in messageSnapshot) {
      message.add(Message.fromJson(e as Map<String, dynamic>));
    }
    return ChatRoom(
        chatId: snapshot['chatId'],
        uid: snapshot['uid'],
        writer: snapshot['writer'],
        contact: snapshot['contact'],
        contactName: snapshot['contactName'],
        messages: message);
  }
}
