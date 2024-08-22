import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_provider.g.dart';

@Riverpod(keepAlive: true)
class bottom_index extends _$bottom_index {
  int count = 0;

  @override
  int build() {
    return count;
  }

  void updateIndex(int index) {
    count = index;
  }

  int getIndex() {
    return count;
  }
}
