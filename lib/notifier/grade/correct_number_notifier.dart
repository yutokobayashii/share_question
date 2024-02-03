

import 'package:hooks_riverpod/hooks_riverpod.dart';

final correctNumberProvider = NotifierProvider<CorrectNumberNotifier, int>(CorrectNumberNotifier.new);

class CorrectNumberNotifier extends Notifier<int> {
  @override
  int build() {

    return 0;
  }

  void optionalIncrement(String answer,String correct) {

    if (answer == correct) {
      state++;
    }

  }

  void commentIncrement(String answer,String correct) {

    if (answer == correct) {
      state++;
    }

  }
}