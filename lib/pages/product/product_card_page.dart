import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/chat/chat_room.dart';
import 'package:flutter_project1/pages/content/home/home_page_provider.dart';
import 'package:flutter_project1/pages/product/product_card_provider.dart';
import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:flutter_project1/repositories/product/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/repositories/chat/chat_repository_provider.dart';

class ProductCardPage extends ConsumerStatefulWidget {
  final String id;

  ProductCardPage({
    required this.id,
  });

  @override
  ConsumerState<ProductCardPage> createState() => _ProductCardPageState();
}

class _ProductCardPageState extends ConsumerState<ProductCardPage> {
  bool favoriteCheck = false;

  Future<void> _findFavorite() async {
    final snapshot = await userCollection.doc(fbAuth.currentUser!.uid).get();
    final data = snapshot.data() as Map<String, dynamic>;
    final favoriteList = data['favoriteProduct'] as List<dynamic>;
    favoriteCheck = favoriteList.contains(widget.id);
  }

  Future<bool> _findChat(String chatId) async {
    DocumentSnapshot chatDoc = await chatCollection.doc(chatId).get();
    return chatDoc.exists;
  }

  Future<void> _chat(DocumentSnapshot doc) async {
    final chatId = doc['uid'] + fbAuth.currentUser!.uid;
    bool chatExists = await _findChat(chatId);

    final userDoc = await userCollection.doc(fbAuth.currentUser!.uid).get();
    final userData = AppUser.fromDoc(userDoc);
    if (chatExists) {
      GoRouter.of(context).go('/chatRoom/$chatId');
    } else {
      ChatRoom chat1 = ChatRoom(
          chatId: doc['uid'] + fbAuth.currentUser!.uid,
          uid: fbAuth.currentUser!.uid,
          writer: userData.name,
          contact: doc['uid'],
          contactName: doc['userName']);
      await ref.read(chatRepositoryProvider).createChat(chatroom: chat1);
      await ref.read(authRepositoryProvider).updateChatId(chatId: chatId);
      await ref
          .read(productRepositoryProvider)
          .updateProduct(productId: widget.id, countContent: 'chat');
      GoRouter.of(context).go('/chatRoom/$chatId');
    }
  }

  void _favorite() {
    if (favoriteCheck) {
      favoriteCheck = false;
      ref
          .read(productFavoriteProvider.notifier)
          .unFavorite(productId: widget.id);
    } else {
      favoriteCheck = true;
      ref.read(productFavoriteProvider.notifier).favorite(productId: widget.id);
    }
  }

  @override
  void initState() {
    _findFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncDoc = ref.watch(getProductDocProvider(widget.id));

    final h = MediaQuery.of(context).size.height;
    final v = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).go('/product/update/${widget.id}');
              },
              icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: asyncDoc.when(
          data: (snapshot) {
            final document = snapshot.data() as Map<String, dynamic>;
            return Column(children: [
              FlutterLogo(
                size: (h / 3),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('닉네임 : ${document['userName']}'),
                          Text('${document['region']}')
                        ],
                      )
                    ],
                  )),
                ],
              ),
              const Divider(),
              SizedBox(
                height: h / 3.2,
                child: Center(
                  child: Text(
                    '${document['desc']}',
                    style: const TextStyle(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: ref.watch(productFavoriteProvider).isLoading
                        ? null
                        : _favorite,
                    icon: Icon(Icons.favorite),
                    color: favoriteCheck ? Colors.red : Colors.grey,
                  ),
                  Text(
                    '  ${document['price']}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        if (document['uid'] == fbAuth.currentUser!.uid) {
                          ref
                              .read(bottom_indexProvider.notifier)
                              .updateIndex(2);
                          return GoRouter.of(context).goNamed(RouteNames.home);
                        } else {
                          await _chat(snapshot);
                        }
                      },
                      child: Text(document['uid'] == fbAuth.currentUser!.uid
                          ? '채팅룸가기'
                          : '채팅하기'))
                ],
              )
            ]);
          },
          error: (e, st) => Center(
                child: Text('Error : $e'),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
