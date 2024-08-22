import 'package:flutter/material.dart';
import 'package:flutter_project1/pages/content/chat/chat_list_page.dart';
import 'package:flutter_project1/pages/content/community/community_page.dart';
import 'package:flutter_project1/pages/content/home/home_page_provider.dart';
import 'package:flutter_project1/pages/product/product_list_page.dart';
import 'package:flutter_project1/pages/profile/profile_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 4,
      vsync: this,
    );
    print(
        'ref.read index ${ref.read(bottom_indexProvider.notifier).getIndex()}');
    index = ref.read(bottom_indexProvider.notifier).getIndex();
    print('this.index ${this.index}}');
    controller.addListener(tabListener);
    controller.animateTo(index);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(bottom_indexProvider, (prev, next) {
      print('현재 index : ${next}');
    });

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
          ref.watch(bottom_indexProvider.notifier).updateIndex(index);
        },
        currentIndex: ref.read(bottom_indexProvider.notifier).getIndex(),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apple), label: '상품'),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: '동네생활'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          ProductPage(),
          CommunityPage(),
          ChatListPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
