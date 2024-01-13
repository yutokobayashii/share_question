

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../entity/question_data/question.dart';


class MakeQuestionProvider {

 static final questionProvider = StateProvider((ref) => "");

 static final imageProvider = StateProvider((ref) => "");

 static final correctProvider = StateProvider((ref) => "");

 static final commentProvider = StateProvider((ref) => "");

 static final optionalProvider = StateProvider.family<String, int>((ref, id) => "");

 static final optionalNumber = StateProvider((ref) => 2);//選択肢2まではマストのため

 static final questionDetailListProvider = StateProvider<List<QuestionDetail>>((ref) => []);

 static final imageFileProvider = StateProvider<XFile?>((ref) => null);

 static final isSelectedItemProvider = StateProvider<String>((ref) => "0");

 static final optionalListProvider = StateProvider<List<String>>((ref) => [ref.watch(optionalProvider(1)),ref.watch(optionalProvider(2))]);

}