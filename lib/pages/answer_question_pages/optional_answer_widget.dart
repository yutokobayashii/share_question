import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/style.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/question_data/question.dart';

class OptionalAnswerWidget extends HookConsumerWidget {
  const OptionalAnswerWidget(
      {super.key, required this.options, required this.yourAnswer});

  final List<OptionalQuestion> options;
  final ValueNotifier<String> yourAnswer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> optionalList = [];

    for (int i = 0; i < options.length; i++) {
      optionalList.add(options[i].optional);
    }

    final selectedOptional = useState(optionalList.first);

    return Column(
      children: optionalList.map((String option) {
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
          title: Text(
            option,
            style: boldTextStyle,
          ),
          leading: Radio<String>(
            activeColor: ColorSharedPreferenceService().getColor(),
            value: option,
            groupValue: selectedOptional.value,
            onChanged: (String? value) {
              selectedOptional.value = value!;

              yourAnswer.value = value;
            },
          ),
        );
      }).toList(),
    );
  }
}
