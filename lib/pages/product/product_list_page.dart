import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrot'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).goNamed(RouteNames.createProduct);
        },
        backgroundColor: Colors.orange[50],
        child: const Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<QuerySnapshot>(
            stream: productCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                    //child: errorDialog(context, snapshot.error as CustomError),
                    child: Text('Error : ${snapshot.error}'));
              }

              final document = snapshot.data!.docs;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final doc = document[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        GoRouter.of(context).push('/product/${doc.id}');
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const FlutterLogo(
                              size: 50,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doc['name'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    doc['region'],
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                  Text(
                                    doc['price'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                        size: 13,
                                      ),
                                      Text(
                                        doc['favoriteCount'].toString(),
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                      const Icon(
                                        Icons.chat,
                                        color: Colors.grey,
                                        size: 13,
                                      ),
                                      Text(
                                        doc['chatCount'].toString(),
                                        style: const TextStyle(fontSize: 13),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
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
