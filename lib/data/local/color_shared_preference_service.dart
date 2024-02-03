import 'package:flutter/material.dart';
import 'package:share_question/data/local/shared_preference_instance.dart';

import '../../constant/color.dart';

class ColorSharedPreferenceService {
  final _instance = SharedPreferencesInstance().prefs;

  Color getColor() {
    final color = Color(_instance.getInt("color") ?? baseColor.value);

    return color;
  }

  Future<void> setColor(int colorInt) async {
    await _instance.setInt("color", colorInt);
  }
}
