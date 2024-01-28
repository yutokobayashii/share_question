

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/db/shared_preference_db.dart';
//
// final libraryIdListProvider = NotifierProvider<LibraryList, List<int>>(LibraryList.new);
//
// class LibraryList extends Notifier<List<int>> {
//   @override
//   List<int> build() {
//     int n = ref.watch(libraryIdProvider)?? 0;
//
//     // 1からnまでのリストを生成
//     List<int> list = List.generate(n, (index) => index + 1);
//     return list;
//   }
//
//   void add(int id) {
//     state = [...state, id];
//   }
//
//   void remove (int id) {
//     state.remove(id);
//   }
// }