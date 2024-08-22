import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_list_provider.g.dart';

@riverpod
Stream<DocumentSnapshot> getChatDoc(GetChatDocRef ref, String chatId) {
  return chatCollection.doc().snapshots();
}
