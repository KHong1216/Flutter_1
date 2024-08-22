import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/chat/chat_room.dart';
import 'package:flutter_project1/models/chat/message.dart';
import 'package:flutter_project1/repositories/handle_exception.dart';

class ChatRepository {
  Future<void> createChat({required ChatRoom chatroom}) async {
    try {
      await chatCollection.doc(chatroom.chatId).set(chatroom.toJson());
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> sendChat(
      {required String chatId, required Message message}) async {
    try {
      final snapshot = await chatCollection.doc(chatId).get();
      if (snapshot.exists) {
        final roomData = ChatRoom.fromDocumentSnapshot(snapshot);
        final messages = List<Message>.from(roomData.messages);
        messages.add(message);
        await chatCollection
            .doc(chatId)
            .update({'messages': messages.map((e) => e.toJson()).toList()});
      }
    } catch (e) {
      throw handleException(e);
    }
  }

  Stream<ChatRoom> getChatData(String chatId) {
    try {
      final stream = chatCollection
          .doc(chatId)
          .snapshots()
          .map((e) => ChatRoom.fromDocumentSnapshot(e));
      return stream;
    } catch (e) {
      throw handleException(e);
    }
  }
}
