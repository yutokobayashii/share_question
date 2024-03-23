import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../usecase/user_info/user_info_usecase.dart';

final userInfoNotifierProvider = NotifierProvider<UserInfoNotifier, void>(UserInfoNotifier.new);

class UserInfoNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<String> sendUserInfo(Map<String, dynamic> userInfo) async {
    return await ref.read(userInfoUseCaseProvider).sendUserInfo(userInfo);
  }
}
