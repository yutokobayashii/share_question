
import 'package:share_question/data/local/shared_preference_instance.dart';


class QuestionNumberSharedPreferenceService {
  final _instance = SharedPreferencesInstance().prefs;

  int getQuestionNumber() {
    final number = _instance.getInt("questionNumber") ?? 0;

    return number;
  }

  Future<void> increaseQuestionNumber() async {
   await _instance.setInt("questionNumber",(_instance.getInt("questionNumber") ?? 0) + 1);
  }

  Future<void> decreaseQuestionNumber() async{
    await _instance.setInt("questionNumber",(_instance.getInt("questionNumber") ?? 0) - 1);
  }
}
