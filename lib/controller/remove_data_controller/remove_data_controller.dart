

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/provider/initial_question_provider.dart';
import 'package:share_question/provider/make_question_provider.dart';

class RemoveDataController {
  

  void removeInitialQuestionData (WidgetRef ref) {

    ref.watch(InitialMakeQuestionProvider.questionNameProvider.notifier).update((state) => "");

    ref.watch(InitialMakeQuestionProvider.authorProvider.notifier).update((state) => "");

    ref.watch(InitialMakeQuestionProvider.commentProvider.notifier).update((state) => "");

    ref.watch(InitialMakeQuestionProvider.explainProvider.notifier).update((state) => "");

  }

  void removeMakeQuestionData (WidgetRef ref) {

    ref.watch(MakeQuestionProvider.commentProvider.notifier).update((state) => "");

    ref.watch(MakeQuestionProvider.correctProvider.notifier).update((state) => "");

    ref.watch(MakeQuestionProvider.questionProvider.notifier).update((state) => "");
    
    ref.watch(MakeQuestionProvider.imageProvider.notifier).update((state) => "");

    ref.watch(MakeQuestionProvider.imageFileProvider.notifier).update((state) => null);
    
    ref.watch(MakeQuestionProvider.optionalNumber.notifier).update((state) => 2);
    
    ref.watch(MakeQuestionProvider.optionalListProvider.notifier).update((state) => []);

    ref.watch(MakeQuestionProvider.questionDetailListProvider.notifier).update((state) => []);
  }

  void removeOptionData (WidgetRef ref) {

   final optionalNumber = ref.watch(MakeQuestionProvider.optionalNumber);

    for(int i = 0; i<optionalNumber; i++){

    ref.watch(MakeQuestionProvider.optionalProvider(i+1).notifier).update((state) => "");
    }

    ref.watch(MakeQuestionProvider.correctProvider.notifier).update((state) => "");

    ref.watch(MakeQuestionProvider.optionalListProvider.notifier).update((state) => []);
  }


}