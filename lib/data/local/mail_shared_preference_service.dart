import 'package:share_question/data/local/shared_preference_instance.dart';

class MailSharedPreferenceService {
  final _instance = SharedPreferencesInstance().prefs;

  String getMail() {
    final mail = _instance.getString("mail") ?? "";

    return mail;
  }

  Future<void> setMail(String mail) async {
    await _instance.setString("mail", mail);
  }
}
