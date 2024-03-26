
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_question/gen/assets.gen.dart';

import '../guide_page.dart';

class SelectGuideWidget extends StatelessWidget {
  const SelectGuideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            GuidePage(
              title: '作問編',
              widgets: [
                GuideImageWidget(assets: Assets.guideMake.home.path,),
                GuideImageWidget(assets: Assets.guideMake.initial.path,),
                GuideImageWidget(assets: Assets.guideMake.makeFree.path,),
                GuideImageWidget(assets: Assets.guideMake.optional1.path,),
                GuideImageWidget(assets: Assets.guideMake.optional2.path,),
                GuideImageWidget(assets: Assets.guideMake.confirm.path,),
                GuideImageWidget(assets: Assets.guideMake.share.path,),


              ],),
            SizedBox(height: 20.h,),

             GuidePage(
              title: '解答編',
              widgets: [
                GuideImageWidget(assets: Assets.guideAnswer.answer.path,),
                GuideImageWidget(assets: Assets.guideAnswer.inputPass.path,),
                GuideImageWidget(assets: Assets.guideAnswer.library.path,),
                GuideImageWidget(assets: Assets.guideAnswer.grade.path,),
              ],),

            SizedBox(height: 20.h,),
          ],
        )
    );
  }
}

class GuideImageWidget extends StatelessWidget {
  const GuideImageWidget({
    super.key,
    required this.assets,
  });

  final String assets;

  @override
  Widget build(BuildContext context) {
    return Image.asset(assets);
  }
}