import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/local/color_shared_preference_service.dart';
import '../../../notifier/status/status_notifier.dart';

class ChangeStatusModalWidget extends HookConsumerWidget {
  const ChangeStatusModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.read(statusNotifierProvider.notifier).getStatus();
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 35,
                  )),
            ),
          ),
          const Text(
            '有料会員',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Icon(
                Icons.edit,
                size: 40,
                color: ColorSharedPreferenceService().getColor(),
              ),
               SizedBox(
                 width: 20.w,
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('無制限の問題作成',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: Colors.black
                    ),),

                  const SizedBox(height: 3,),

                  Text('無料会員では、\n3つの問題集まで作成できますが、\n有料会員では無制限に作問できます。',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: Colors.black45
                    ),)
                ],
              )
            ]),
          ),

          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_library,
                    size: 40,
                    color: ColorSharedPreferenceService().getColor(),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('無制限の画像アップロード',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: Colors.black
                        ),),

                      const SizedBox(height: 3,),

                      Text('無料会員では、\n１つの問題集に5つまで\n画像をアップロードできますが、\n有料会員では無制限に\nアップロードできます。',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: Colors.black45
                        ),)
                    ],
                  )
                ]),
          ),



          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 300.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.flash_on,
                    size: 40,
                    color: ColorSharedPreferenceService().getColor(),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('その他機能全般',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: Colors.black
                        ),),

                      const SizedBox(height: 3,),

                      Text('無料会員で使用可能な機能に加え、\nさらに今後も有料会員限定機能を\n実装予定です。',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: Colors.black45
                        ),)
                    ],
                  )
                ]),
          ),

          SizedBox(
            height: 60.h,
          ),

          GestureDetector(
            onTap: () {
              if (status) {
                ref.read(statusNotifierProvider.notifier).toFree();
              } else {
                ref.read(statusNotifierProvider.notifier).toPayed();
              }
            },
            child: Container(
              width: 270.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorSharedPreferenceService().getColor(),
              ),
              child: Center(
                child: (status) ?
                     Text('350円/月',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.white
                ),)
                    :
                    Text('解約する',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.white
                    ),)
              ),
            ),
          )
        ],
      ),
    );
  }
}
