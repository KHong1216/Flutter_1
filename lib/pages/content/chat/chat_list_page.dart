import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/pages/content/chat/chat_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> {
  String contactName = '';
  Map<String, dynamic> user = Map<String, dynamic>();

  Future<void> _fetchName({required String uid}) async {
    final chatSnapshot = await userCollection.doc(uid).get();
    final userData = chatSnapshot.data() as Map<String, dynamic>;
    contactName = userData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatRoom'),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouteNames.home);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<QuerySnapshot>(
            stream: chatCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error : ${snapshot.error}'));
              }

              final document = snapshot.data!.docs;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final doc = document[index];
                    final toSnapshot = doc as DocumentSnapshot;
                    final messages = toSnapshot['messages'] as List<dynamic>;
                    final message =
                        messages[messages.length - 1] as Map<String, dynamic>;
                    final contact =
                        toSnapshot['contact'] == fbAuth.currentUser!.uid
                            ? toSnapshot['writer']
                            : toSnapshot['contact'];
                    _fetchName(uid: contact);

                    final findChat = doc['chatId'].toString();
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push('/chatRoom/${doc.id}');
                      },
                      child: findChat.contains(fbAuth.currentUser!.uid)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  FlutterLogo(
                                    size: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message['senderName'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${message['content']}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ])
                          : Row(
                              children: [],
                            ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: document.length);
            },
          )),
    );
  }
}
