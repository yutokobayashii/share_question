
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/db/shared_preference_db.dart';

import '../../../constant/style.dart';
import '../../../repository/library_data_repoditory.dart';
import '../../../widgets/dialog_widget.dart';
import '../answer_page.dart';


class QuestionListWidget extends HookConsumerWidget {
  const QuestionListWidget({
    super.key,
    required this.action,
    required this.removeContent,
  });

  final VoidCallback action;
  final String removeContent;

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    final int id = ref.watch(libraryIdProvider) ?? 0;

    final data = ref.watch(libraryDataProvider(id));


    return data.when(
        error: (e,t) {
          debugPrint(e.toString());
          return const SizedBox();
        },
        loading: () {
         return const CircularProgressIndicator();
        },
        data: (data) {

          if (data.isEmpty) {
           return const Text('ライブラリに追加されたデータはありません。');
          } else {

            return Expanded(
              child: ListView.builder(
                itemCount: id,
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
                              Text(data[index].name,
                                style: boldTextStyle,
                              ),
                              SizedBox(height: 5.h,),
                              Row(
                                children: [
                                  Text("問題数:",
                                    style: boldTextStyle,
                                  ),
                                  Text(data[index].questionDetailList.length.toString(),
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
                                  Text(data[index].author,
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
                                    child: Text(data[index].explain,
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

        },
    );
      }
    }