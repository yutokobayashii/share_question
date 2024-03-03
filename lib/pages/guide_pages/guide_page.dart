
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/pages/guide_pages/guide_widget/guide_page_widget.dart';

import '../../constant/style.dart';




class GuidePage extends StatelessWidget {
  const GuidePage({
    super.key,
    required this.title,
    required this.widgets
  });

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GuidePageWidget(title:title, widgets: widgets,)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
             SizedBox(height: 30.h,),

            Container(
              width: MediaQuery.of(context).size.width - 50.w,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),

              child: Center(child: Text(title,style: boldTextStyle,)),
            )

          ],
        ),
      ),
    );
  }
}


