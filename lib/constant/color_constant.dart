

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color baseColor = Colors.cyan;

 final boldTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600
);

 final normalTextStyle = TextStyle(
   fontSize: 14.sp,
  fontWeight: FontWeight.w400
 );


TextStyle colorBoldTextStyle(Color color) {
 return TextStyle(
     color: color,
     fontSize: 18.sp,
     fontWeight: FontWeight.w600
 );
}
