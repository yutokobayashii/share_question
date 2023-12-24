
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/constant/color_constant.dart';

import '../../widgets/base_textfield_widget.dart';

class OptionMakeQuestionWidget extends StatelessWidget {
  const OptionMakeQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [

             SizedBox(height: 15.h,),

             BaseTextFieldWidget(
              title: '選択肢1',
              isRequired: false,
              maxLength: 30,
              height: 70.h,
            ),

            BaseTextFieldWidget(
              title: '選択肢2',
              isRequired: false,
              maxLength: 30,
              height: 70.h,
            ),

             BasicAddWidget(
              text: '選択肢を追加',
              icon: Icons.add,
              action: () {

              },
             ),
          ],
        );
    }
  }

class BasicAddWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
                  color: baseColor,
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                color: baseColor,
              )
          ),

        ],
      ),
    );
  }
}
