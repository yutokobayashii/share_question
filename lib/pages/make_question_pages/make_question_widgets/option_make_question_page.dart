import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/controller/optional_make_question_controller/optional_make_question_controller.dart';

import '../../../data/local/color_shared_preference_service.dart';
import '../../../widgets/base_textfield_widget.dart';
import 'initial_make_question_page.dart';

class OptionMakeQuestionWidget extends HookConsumerWidget {
  const OptionMakeQuestionWidget({
    super.key,
    required this.optionalList,
    required this.isSelectedOptionalItem,
    required this.optionalNumber

  });

  final ValueNotifier<List<String>> optionalList;
  final ValueNotifier<String> isSelectedOptionalItem;
  final ValueNotifier<int> optionalNumber;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = useState<List<TextEditingController>>([]);


    useEffect(() {
      // 項目が追加された場合、新しいコントローラーを追加
      while (controllers.value.length < optionalNumber.value) {
        controllers.value.add(TextEditingController());
      }

      // 項目が削除された場合、余分なコントローラーを破棄して削除
      while (controllers.value.length > optionalNumber.value) {
        controllers.value.removeLast().dispose();
      }

      // 破棄処理
      return () {};
    }, [optionalNumber.value]);

    List<Widget> additionalOptionWidget() {
      return List.generate(optionalNumber.value - 2, (i) {
        return BaseTextFieldWidget(
          title: '選択肢${i + 3}',
          maxLength: 30,
          height: 90.h,
          controller: controllers.value[i],
          rightWidget: GestureDetector(
            onTap: () {
              optionalNumber.value--;

              controllers.value[i].clear();

              isSelectedOptionalItem.value = "0";


              final updatedList = List<String>.from(optionalList.value);
              // 特定のインデックスの要素を削除
              updatedList.removeAt(i);
              // 更新されたリストで状態を更新
              optionalList.value = updatedList;

            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: ColorSharedPreferenceService().getColor(),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: ColorSharedPreferenceService().getColor(),
                  size: 20,
                )),
          ),
          onChanged: (text) {},
          onSubmitted: (text) {

            List<String> updatedList = List<String>.from(optionalList.value);

            updatedList[i+2] = text;

            optionalList.value = updatedList;
          },
        );
      });
    }

    return Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        BaseTextFieldWidget(
          title: '選択肢1',
          maxLength: 30,
          height: 90.h,
          controller: OptionalMakeQuestionController.optionalController1,
          rightWidget: const IsRequiredWidget(),
          onChanged: (text) {

            List<String> updatedList = List<String>.from(optionalList.value);

            updatedList[0] = text;

            optionalList.value = updatedList;
          },
          onSubmitted: (text) {},
        ),
        BaseTextFieldWidget(
          title: '選択肢2',
          maxLength: 30,
          height: 90.h,
          controller: OptionalMakeQuestionController.optionalController2,
          rightWidget: const IsRequiredWidget(),
          onChanged: (text) {

            List<String> updatedList = List<String>.from(optionalList.value);

            updatedList[1] = text;

            optionalList.value = updatedList;
          },
          onSubmitted: (text) {},
        ),
        Column(
          children: additionalOptionWidget(),
        ),
        BasicAddWidget(
          text: '選択肢を追加',
          icon: Icons.add,
          action: () {
            if (optionalNumber.value < 10) {
              optionalNumber.value++;

              optionalList.value.add("");
            }
          },
        ),
        SizedBox(
          height: 15.h,
        ),
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
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: action,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: ColorSharedPreferenceService().getColor(),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: ColorSharedPreferenceService().getColor(),
              )),
        ],
      ),
    );
  }
}
