
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallMainHomeWidget extends StatelessWidget {
  const SmallMainHomeWidget({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.action,
    required this.angle,
  });

  final double width;
  final Icon icon;
  final double angle;
  final String title;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: width / 2 - 10.w,
        height: 80.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: angle,
                child: icon),
            SizedBox(width: 5.w,),
            Text(title)
          ],
        ),

      ),
    );
  }
}