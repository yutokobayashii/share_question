import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/usecase/mail/mail_usecase.dart';

final mailNotifierProvider = NotifierProvider<MailNotifier, void>(MailNotifier.new);

class MailNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  String getMail() {
   return ref.read(mailUseCaseProvider).getMail();
  }

  Future<void> setMail(String mail) async {
    await ref.read(mailUseCaseProvider).setMail(mail);
  }
}