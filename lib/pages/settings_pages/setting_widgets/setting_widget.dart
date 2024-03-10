import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.title,
    required this.action,
     this.color = Colors.black,
  });

  final String title;
  final VoidCallback action;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: action,
        child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery
              .of(context)
              .size
              .width - 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: color
              )),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}