
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/controller/optional_make_question_controller/optional_make_question_controller.dart';
import 'package:share_question/provider/make_question_provider.dart';

import '../../../provider/shared_prefrence_provider.dart';
import '../../../widgets/base_textfield_widget.dart';
import 'initial_make_question_page.dart';

class OptionMakeQuestionWidget extends HookConsumerWidget {
  const OptionMakeQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final addOptionNumber = useState(2);
    List<String> tempList = [];
    final controllers = useState<List<TextEditingController>>([]);
    final currentList = ref.watch(MakeQuestionProvider.optionalListProvider);

    void removeItem(WidgetRef ref, String item) {
      ref.read(MakeQuestionProvider.optionalListProvider.notifier).update((state) =>
          state.where((i) => i != item).toList()
      );
    }


    useEffect(() {
      // 項目が追加された場合、新しいコントローラーを追加
      while (controllers.value.length < addOptionNumber.value) {
        controllers.value.add(TextEditingController());
      }

      // 項目が削除された場合、余分なコントローラーを破棄して削除
      while (controllers.value.length > addOptionNumber.value) {
        controllers.value.removeLast().dispose();
      }

      // 破棄処理
      return () {};
    }, [addOptionNumber.value]);

    List<Widget> additionalOptionWidget() {
     return List.generate(addOptionNumber.value -2, (i) {
        return BaseTextFieldWidget(
          title: '選択肢${i + 3}',
          maxLength: 30,
          height: 70.h,
          controller: controllers.value[i],
          rightWidget: GestureDetector(
            onTap: () {
              addOptionNumber.value--;
              ref.watch(MakeQuestionProvider.optionalNumber.notifier).update((state) => addOptionNumber.value);
              removeItem(ref, ref.watch(MakeQuestionProvider.optionalProvider(i + 3)));
              ref.watch(MakeQuestionProvider.optionalProvider(i + 3).notifier).update((state) => "");
              controllers.value[i].clear();
              ref.watch(MakeQuestionProvider.isSelectedItemProvider.notifier).update((state) => "0");
            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Color(
                        ref.watch(colorSharedPreferencesProvider).getInt(
                            "color") ?? baseColor.value),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Color(ref.watch(colorSharedPreferencesProvider).getInt(
                      "color") ?? baseColor.value),
                  size: 20,
                )
            ),
          ),
          onChanged: (text) {


              removeItem(ref, ref.watch(MakeQuestionProvider.optionalProvider(i + 3)));


            ref.watch(MakeQuestionProvider.optionalProvider(i + 3).notifier).update((state) => text);

          },
          onSubmitted: (text) {
            tempList = [
              ...currentList,
              ref.watch(MakeQuestionProvider.optionalProvider(i + 3))
            ];

            ref.watch(MakeQuestionProvider.optionalListProvider.notifier).update((state) => tempList);

          },
        );
      }
      );
    }


    return Column(
          children: [

             SizedBox(height: 15.h,),

            BaseTextFieldWidget(
              title: '選択肢1',
              maxLength: 30,
              height: 70.h,
              controller: OptionalMakeQuestionController.optionalController1,
              rightWidget: const IsRequiredWidget(),
              onChanged: (text) {
                ref.watch(MakeQuestionProvider.optionalProvider(1).notifier).update((state) => text);
              },
              onSubmitted: (text) {

              },
            ),

            BaseTextFieldWidget(
              title: '選択肢2',
              maxLength: 30,
              height: 70.h,
              controller: OptionalMakeQuestionController.optionalController2,
              rightWidget: const IsRequiredWidget(),
              onChanged: (text) {
                ref.watch(MakeQuestionProvider.optionalProvider(2).notifier).update((state) => text);
              },
              onSubmitted: (text) {

              },
            ),



            Column(
              children: additionalOptionWidget(),
            ),


             BasicAddWidget(
              text: '選択肢を追加',
              icon: Icons.add,
              action: () {
                if (addOptionNumber.value < 10) {
                  addOptionNumber.value++;
                  ref.watch(MakeQuestionProvider.optionalNumber.notifier).update((state) => addOptionNumber.value);
                }
              },
             ),

            SizedBox(height: 15.h,),


          ],
        );
    }
  }

class BasicAddWidget extends HookConsumerWidget {
  const BasicAddWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.action,
  });

  final String text;
  final IconData icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: action,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600
            ),
          ),
           SizedBox(width: 10.w,),
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
              )
          ),

        ],
      ),
    );
  }
}
