

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomDialog(BuildContext context) {
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
        height: 126.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color.fromRGBO(0, 0, 0, 0.4),
            ),
          ),
        ),
        child: const Center(
          child: Text("message"),
        ),
      ),
    ),
  );
}
