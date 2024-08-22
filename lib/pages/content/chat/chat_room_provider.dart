import 'package:flutter_project1/models/chat/message.dart';
import 'package:flutter_project1/repositories/chat/chat_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_room_provider.g.dart';

@riverpod
class SendMessage extends _$SendMessage {
  @override
  FutureOr<void> build() {}

  Future<void> sendMessage(
      {required String chatId, required Message message}) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => ref
        .read(chatRepositoryProvider)
        .sendChat(chatId: chatId, message: message));
  }
}
