import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constant/style.dart';

class SelectOptionalWidget extends HookConsumerWidget {
  const SelectOptionalWidget({
    super.key,
    required this.correctAnswer,
    required this.optionalList,
    required this.optionalNumber,
    required this.isSelectedOptionalItem
  });

  final ValueNotifier<String> correctAnswer;
  final ValueNotifier<List<String>> optionalList;
  final ValueNotifier<int> optionalNumber;
  final ValueNotifier<String> isSelectedOptionalItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (optionalList.value.isEmpty) {
      return const SizedBox();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            '正解',
            style: boldTextStyle,
          ),
          SizedBox(
            width: 250.w,
            child: DropdownButton(
              isExpanded: true,
              padding: const EdgeInsets.all(8),
              items: [
                const DropdownMenuItem(
                  value: "0",
                  child: Text("解答を選択してください"),
                ),
                //for文でlistを回す
                for (int i = 0;
                    i < optionalNumber.value;
                    i++) ...{
                  DropdownMenuItem(
                    value: "${i + 1}",
                    child: Text("選択肢${i + 1}"),
                  ),
                },
              ],
              onChanged: (text) {
                if (text == "0") {
                  isSelectedOptionalItem.value = text.toString();
                } else {
                  isSelectedOptionalItem.value = text.toString();
                  correctAnswer.value = optionalList.value[int.parse(text.toString()) - 1];
                }
              },
              value: isSelectedOptionalItem.value,
            ),
          ),
        ],
      );
    }
  }
}
