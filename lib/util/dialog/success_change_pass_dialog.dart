

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/constant/color.dart';

import '../../gen/assets.gen.dart';

void showSuccessChangePassDialog(BuildContext context) {
  showDialog(
      context: context, builder: (context) => _createCustomDialog(context));
}

Dialog _createCustomDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 270.w,
        height: 270.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Text('パスワードを変更しました。',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: baseColor
                ),),

              SizedBox(height: 10.h,),



              SizedBox(
                width: 200.w,
                height: 200.h,
                child: Image.asset(Assets.images.screen.path),
              )
            ],
          ),
        ),
      ),
    ),
  );
}