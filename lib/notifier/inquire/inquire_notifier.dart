import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../usecase/inquire/inquire_usecase.dart';

final inquireNotifierProvider = NotifierProvider<InquireNotifier, void>(InquireNotifier.new);

class InquireNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<String> sendInquire(Map<String, dynamic> inquireData) async {
    return await ref.read(inquireUseCaseProvider).sendInquire(inquireData);
  }
}