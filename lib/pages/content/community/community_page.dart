import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동네생활'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).goNamed(RouteNames.createPost);
        },
        backgroundColor: Colors.orange[50],
        child: Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<QuerySnapshot>(
            stream: communityCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                    //child: errorDialog(context, snapshot.error as CustomError),
                    child: Text('Error : ${snapshot.error}'));
              }

              final document = snapshot.data!.docs;
              document.sort((a, b) => a.id.compareTo(b.id));
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final doc = document[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        GoRouter.of(context).push('/community/${doc.id}');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '일반',
                            style: TextStyle(
                                backgroundColor:
                                    Color.fromARGB(255, 211, 209, 209)),
                          ),
                          Text(
                            doc['name'],
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            doc['desc'],
                            style: TextStyle(fontSize: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.comment,
                                color: Colors.grey,
                                size: 15,
                              ),
                              Text(
                                doc['commentCount'].toString(),
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
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
