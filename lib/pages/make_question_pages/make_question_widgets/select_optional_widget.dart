

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/provider/make_question_provider.dart';

import '../../../constant/style.dart';

class SelectOptionalWidget extends HookConsumerWidget {
  const SelectOptionalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                for(int i = 0; i<ref.watch(MakeQuestionProvider.optionalNumber); i++) ...{
                  DropdownMenuItem(
                    value: "${i+1}",
                    child: Text("選択肢${i+1}"),
                  ),
                },
              ],
              onChanged: (text) {

                if (text == "0") {
                  ref.watch(MakeQuestionProvider
                      .isSelectedItemProvider.notifier)
                      .update((state) => text.toString());

                  ref.watch(MakeQuestionProvider
                      .correctProvider.notifier)
                      .update((state) => "");


                } else {

                  ref.watch(MakeQuestionProvider
                      .isSelectedItemProvider.notifier)
                      .update((state) => text.toString());
                  ref.watch(MakeQuestionProvider
                      .correctProvider.notifier).update((state) => ref.watch(MakeQuestionProvider.optionalListProvider)[int.parse(text.toString()) -1]);


                }


              },
              value: ref.watch(MakeQuestionProvider.isSelectedItemProvider),
            ),
          ),

        ],
      );
    }

  }
}
