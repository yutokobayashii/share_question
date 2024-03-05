import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../usecase/status/status_usecase.dart';

final statusNotifierProvider = NotifierProvider<StatusNotifier, void>(StatusNotifier.new);

class StatusNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  bool getStatus(){
    return ref.read(statusUseCaseProvider).getStatus();
  }

  Future<void> toPayed() async {
    await ref.read(statusUseCaseProvider).toPayed();
  }

  Future<void> toFree() async {
    await ref.read(statusUseCaseProvider).toFree();
  }
}