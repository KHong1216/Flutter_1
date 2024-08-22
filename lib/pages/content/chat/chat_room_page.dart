import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/chat/message.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/repositories/chat/chat_repository_provider.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/pages/content/chat/chat_room_provider.dart';
import 'package:flutter_project1/pages/widgets/buttons.dart';
import 'package:flutter_project1/pages/widgets/form_field.dart';
import 'package:go_router/go_router.dart';

class ChatRoomPage extends ConsumerStatefulWidget {
  final String id;
  const ChatRoomPage({
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  Future<void> send() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    final userDoc = await userCollection.doc(fbAuth.currentUser!.uid).get();
    final userData = AppUser.fromDoc(userDoc);

    final message = Message(
        content: _chatController.text.trim(),
        sender: fbAuth.currentUser!.uid,
        createdAt: Timestamp.now().toString(),
        senderName: userData.name);

    ref
        .read(chatRepositoryProvider)
        .sendChat(chatId: widget.id, message: message);
    Future.delayed(const Duration(seconds: 1));
    _chatController.clear();
    setState(() {
      _autovalidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(sendMessageProvider, (prev, next) {
      next.whenOrNull(error: (e, st) => errorDialog(context, e as CustomError));
    });

    final sendState = ref.watch(sendMessageProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => GoRouter.of(context).goNamed(RouteNames.home),
        ),
      ),
      body: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: chatCollection.doc(widget.id).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error : ${snapshot.error}'));
                      }

                      final document = snapshot.data!;
                      final data = document.data() as Map<String, dynamic>;
                      final messages = data['messages'] as List<dynamic>;
                      return ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.white,
                            );
                          },
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message =
                                messages[index] as Map<String, dynamic>;
                            final sender = message['sender'] as String;
                            final text = message['content'] as String;
                            final bool isMe = sender == fbAuth.currentUser!.uid;
                            return Row(
                              mainAxisAlignment: isMe
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: isMe
                                          ? Colors.grey[300]
                                          : Colors.grey[500],
                                      borderRadius: isMe
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(14),
                                              topRight: Radius.circular(14),
                                              bottomLeft: Radius.circular(14))
                                          : const BorderRadius.only(
                                              topLeft: Radius.circular(14),
                                              topRight: Radius.circular(14),
                                              bottomRight:
                                                  Radius.circular(14))),
                                  child: isMe
                                      ? Row(
                                          children: [
                                            Text(text),
                                            isMe
                                                ? const Icon(Icons.person)
                                                : SizedBox(),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            const Icon(Icons.person),
                                            Text(text)
                                          ],
                                        ),
                                ),
                              ],
                            );
                          });
                    }),
              ),
              ChatFormField(chatController: _chatController),
              CustomFilledButton(
                  fontsize: 16,
                  fontWeight: FontWeight.w600,
                  child: Text(sendState.maybeWhen(
                    orElse: () => 'Send',
                    loading: () => 'Sending',
                  )),
                  onPressed: sendState.maybeWhen(
                    orElse: () => send,
                    loading: () => null,
                  ))
            ],
          )),
    );
  }
}
