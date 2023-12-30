
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constant/color_constant.dart';
import '../../../provider/shared_prefrence_provider.dart';
import '../../../widgets/dialog_widget.dart';
import '../../answer_question_pages/answer_question_page.dart';
import '../answer_page.dart';


class QuestionListWidget extends StatelessWidget {
  const QuestionListWidget({
    super.key,
    required this.ref,
    required this.action,
    required this.removeContent,
  });

  final WidgetRef ref;
  final VoidCallback action;
  final String removeContent;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: ref.watch(testList).length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
            key: UniqueKey(),
            confirmDismiss: (direction) async {
              final confirm =  await showDialog<bool>(
                context: context,
                builder: (BuildContext context1) => AlertDialogWidget(
                  title: 'この問題を削除しますか？',
                  content:removeContent,
                  leftText: '削除する',
                  rightText: 'キャンセル',
                  rightAction: () {
                    Navigator.of(context1).pop(false);
                  },
                  leftAction: () {
                    Navigator.of(context1).pop(true);
                  },

                ),
              );
              return confirm ?? false;
            },
            onDismissed: (direction) {
              ref.read(testList.notifier).update((state) {
                final newList = List<String>.from(state)..removeAt(index);
                return newList;
              });
            },
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: Text('削除',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            child: GestureDetector(
              onTap: action,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 220.h,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    )

                ),


                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Text(ref.watch(testList)[index],
                        style: boldTextStyle,
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Text("問題数:",
                            style: boldTextStyle,
                          ),
                          Text("６問",
                            style: boldTextStyle,
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Text("作成者",
                            style: boldTextStyle,
                          ),
                          Text("小林優斗",
                            style: boldTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("説明:",
                            style: boldTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ",
                              style: normalTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}