import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/constant/color.dart';

import '../../gen/assets.gen.dart';

void showSuccessInquireDialog(BuildContext context) {
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
        width: 300.w,
        height: 300.h,
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
              Text('送信完了',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: baseColor
                ),),

              SizedBox(height: 10.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Text('送信された内容は、\nアプリの機能改善に利用させていただきます。',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp
                  ),),
              ),

              SizedBox(
                width: 170.w,
                height: 170.h,
                child: Image.asset(Assets.images.screen.path),
              )
            ],
          ),
        ),
      ),
    ),
  );
}