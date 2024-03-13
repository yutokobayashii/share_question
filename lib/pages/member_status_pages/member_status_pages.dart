import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/local/color_shared_preference_service.dart';
import '../../notifier/status/status_notifier.dart';
import '../settings_pages/setting_widgets/change_status_modal_widget.dart';

class MemberStatusPages extends HookConsumerWidget {
  const MemberStatusPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFreeOpened = useState(false);
    final isPayedOpened = useState(false);
    final status = ref.read(statusNotifierProvider.notifier).getStatus();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 28,
            )),
        title: const Text('会員ステータス'),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '現在のステータス',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      (status) ? '有料会員' : '無料会員',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            isDismissible: true,
                            builder: (BuildContext context) {
                              return const ChangeStatusModalWidget();
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '変更する',
                            style: TextStyle(
                                color: ColorSharedPreferenceService().getColor()),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      '有効期間:',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '~2/17',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                GestureDetector(
                  onTap: () {
                    isFreeOpened.value = !isFreeOpened.value;
                  },
                  child: Row(
                    children: [
                      Text(
                        '無料会員',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.sp),
                      ),
                      (isFreeOpened.value)
                          ? const Icon(Icons.arrow_drop_up_outlined)
                          : const Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),
                (isFreeOpened.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'できること',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.sp),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.check_box_outlined,
                              color: ColorSharedPreferenceService().getColor(),),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '問題集の作成が最大3つまで可能。',
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.check_box_outlined,
                                color: ColorSharedPreferenceService().getColor()),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '各問題集につき、画像のアップロードは最大5枚まで。',
                              style: TextStyle(fontSize: 13.sp),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                           Icon(Icons.check_box_outlined,
                                color: ColorSharedPreferenceService().getColor()),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'その他アプリ機能全般。',
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ]),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    isPayedOpened.value = !isPayedOpened.value;
                  },
                  child: Row(
                    children: [
                      Text(
                        '有料会員',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.sp),
                      ),
                      (isPayedOpened.value)
                          ? const Icon(Icons.arrow_drop_up_outlined)
                          : const Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),
                (isPayedOpened.value)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '料金',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.sp),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.check_box_outlined,
                                color: ColorSharedPreferenceService().getColor()),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '1ヶ月:350円',
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ]),
            
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'できること',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.sp),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.check_box_outlined,
                                color: ColorSharedPreferenceService().getColor()),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '無制限の問題集の作成が可能。',
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.check_box_outlined,
                                color: ColorSharedPreferenceService().getColor()),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '問題集ごとに無制限の画像アップロード。',
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Icon(Icons.check_box_outlined,
                                color: ColorSharedPreferenceService().getColor()),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'その他アプリ機能全般。',
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ]),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
