
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomeWidget extends StatelessWidget {
  const MainHomeWidget({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.content,
    required this.action,
  });

  final double width;
  final Icon icon;
  final String title;
  final String content;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
          width: width,
          height: 100.h,
          decoration: BoxDecoration(
            //  color: Colors.red,
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(width: 10.w,),
                  Text(title,
                    style: TextStyle(
                        fontSize: 22.sp
                    ),)
                ],
              ),
              SizedBox(height: 5.h,),
              Text(content,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ],
          )
      ),
    );
  }
}