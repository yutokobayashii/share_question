
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';

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

    return  Column(
          children: [

             SizedBox(height: 15.h,),

            BaseTextFieldWidget(
              title: '選択肢1',
              maxLength: 30,
              height: 70.h,
              rightWidget: const IsRequiredWidget(),
              onChanged: (text) {

              },
              onSubmitted: (text) {

              },
            ),

            BaseTextFieldWidget(
              title: '選択肢2',
              maxLength: 30,
              height: 70.h,
              rightWidget: const IsRequiredWidget(),
              onChanged: (text) {

              },
              onSubmitted: (text) {

              },
            ),

            for(int i = 2; i<addOptionNumber.value; i++) ...{
              BaseTextFieldWidget(
                title: '選択肢${i+1}',
                maxLength: 30,
                height: 70.h,
                rightWidget: GestureDetector(
                  onTap: () {
                    addOptionNumber.value--;
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Color(ref.watch(colorSharedPreferencesProvider).getInt("color") ?? baseColor.value),
                        size: 20,
                      )
                  ),
                ),
                onChanged: (text) {

              },
                onSubmitted: (text) {

              },
              ),
            },

             BasicAddWidget(
              text: '選択肢を追加',
              icon: Icons.add,
              action: () {
                if (addOptionNumber.value < 6) {
                  addOptionNumber.value++;
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
