import 'package:share_question/data/local/shared_preference_instance.dart';


class MemberStatusSharedPreferenceService {
  final _instance = SharedPreferencesInstance().prefs;

  bool getStatus() {
    final number = _instance.getBool("status") ?? false;

    return number;
  }

  Future<void> toPayed() async {
    await _instance.setBool("status",true);
  }

  Future<void> toFree() async{
    await _instance.setBool("status",false);
  }
}
