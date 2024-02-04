

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/usecase/grade_data_usecase.dart';

import '../../entity/grade_data/grade.dart';

final gradeListNotifierProvider = NotifierProvider<GradeListNotifier, Future<List<Grade>>>(GradeListNotifier.new);

class GradeListNotifier extends Notifier<Future<List<Grade>>> {
  @override
  Future<List<Grade>> build() {
    final data = ref.watch(gradeDataUseCaseProvider).getGradeFromSqLite();
    return data;
  }

}