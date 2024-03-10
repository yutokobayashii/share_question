import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/usecase/user/user_usecase.dart';

final userNotifierProvider =
    NotifierProvider<UserNotifier, void>(UserNotifier.new);

class UserNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> deleteAccount(User user) async {
    await ref.read(userUseCaseProvider).deleteAccount(user);
  }

  Future<void> updatePassword(User user, String newPassword) async {
    await ref.read(userUseCaseProvider).updatePassword(user, newPassword);
  }

  Future<void> renewPassword(User user, String newPassword) async {
    await ref.read(userUseCaseProvider).renewPassword(user, newPassword);
  }

  Future<bool> reAuthenticate(User user,String oldPassword) async {
    return await ref.read(userUseCaseProvider).reAuthenticate(user, oldPassword);
  }
}
