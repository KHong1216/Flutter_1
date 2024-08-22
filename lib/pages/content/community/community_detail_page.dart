import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/community/comment.dart';
import 'package:flutter_project1/pages/content/community/community_detail_provider.dart';
import 'package:flutter_project1/pages/widgets/form_field.dart';
import 'package:flutter_project1/repositories/community/community_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityDetailPage extends ConsumerStatefulWidget {
  final String id;

  CommunityDetailPage({
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommunityDetailPageState();
}

class _CommunityDetailPageState extends ConsumerState<CommunityDetailPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final _form = _formKey.currentState;
    if (_form == null || !_form.validate()) return;

    final userDoc = await userCollection.doc(fbAuth.currentUser!.uid).get();
    final userData = AppUser.fromDoc(userDoc);

    final comment = Comment(
        content: _commentController.text.trim(),
        uid: fbAuth.currentUser!.uid,
        userName: userData.name,
        createdAt: Timestamp.now().toString());
    ref
        .read(createCommentProvider.notifier)
        .create(postId: widget.id, comment: comment);
    Future.delayed(const Duration(seconds: 1));
    _commentController.clear();
    ref
        .read(communityRepositoryProvider)
        .updateCommunity(postId: widget.id, updateContent: 'comment');
    setState(() {
      _autovalidateMode = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncDoc = ref.watch(getCommunityDocProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: asyncDoc.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (snapshot) {
              final document = snapshot.data() as Map<String, dynamic>;
              final comments = document['comment'] as List<dynamic>;
              return Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(document['writer']), Text('화정동')],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    document['name'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(document['desc']),
                  const SizedBox(
                    height: 160,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('댓글'),
                      Container(
                          child: const Row(
                        children: [
                          Text('등록순'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('최신순')
                        ],
                      ))
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    itemBuilder: (context, index) {
                      final comment = comments[index] as Map<String, dynamic>;
                      return Row(
                        children: [
                          Icon(Icons.person),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(comment['userName']),
                              const Text('화정동'),
                              Text(comment['content'])
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: comments.length,
                  )),
                  CommentFormField(commentController: _commentController),
                  IconButton(
                      onPressed: ref.watch(createCommentProvider).isLoading
                          ? null
                          : _submit,
                      icon: ref.watch(createCommentProvider).isLoading
                          ? CircularProgressIndicator()
                          : Icon(Icons.send))
                ],
              );
            },
            error: (e, st) => Center(
              child: Text('Error : $e'),
            ),
          ),
        ),
      ),
    );
  }
}
