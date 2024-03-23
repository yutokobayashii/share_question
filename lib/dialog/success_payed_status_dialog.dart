
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color.dart';
import '../gen/assets.gen.dart';

void showPayedStatusDialog(BuildContext context) {
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
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '有料会員に変更されました。',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: baseColor),
                ),
              ),
              SizedBox(
                height: 10.h,
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
