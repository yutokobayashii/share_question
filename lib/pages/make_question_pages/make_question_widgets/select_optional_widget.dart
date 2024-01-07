
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/provider/make_question_provider.dart';

class SelectOptionalWidget extends HookConsumerWidget {
  const SelectOptionalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final  isSelectedItem = useState("1");
    if (ref.watch(MakeQuestionProvider.optionalListProvider).isEmpty) {
      return const SizedBox();
    }
    else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Text('正解',style: boldTextStyle,),
          SizedBox(
            width: 200,
            child: DropdownButton(
              isExpanded: true,
              padding: const EdgeInsets.all(8),
              items: [
                //for文でlistを回す
                for(int i = 0; i<ref.watch(MakeQuestionProvider.optionalListProvider).length; i++) ...{
                  DropdownMenuItem(
                    value: "$i",
                    child: Text(ref.watch(MakeQuestionProvider.optionalListProvider)[i]),
                  ),
                },
              ],
              onChanged: (text) {
                isSelectedItem.value = text!;
              },
              value: isSelectedItem.value,
            ),
          ),

        ],
      );
    }

  }
}
