
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constant/style.dart';
import '../../../data/local/question_sqflite_dao.dart';
import '../../../repository/library/library_data_repoditory.dart';
import '../../../widgets/dialog_widget.dart';
import '../../answer_question_pages/answer_question_page.dart';


class QuestionListWidget extends HookConsumerWidget {
  const QuestionListWidget({
    super.key,
    required this.removeContent,
  });

  final String removeContent;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final questionSqfliteDao = QuestionSqfliteDao();

    final data = ref.watch(libraryRepositoryProvider);


    return data.when(
       error: (e,t) {
         return Center(child: Text('エラーが発生しました: $e'));
       },
       loading: () {
         return const Center(child: CircularProgressIndicator());
       },
        data: (data) {
         if(data.isEmpty) {
           return const Text(
             'あなたが解答可能な問題はありません。\n誰かが作成した問題を解くために、\nパスワードを共有してもらいましょう。',
             style: TextStyle(
                 color: Colors.black54
             ),
           );

         } else{
           return Expanded(
             child: ListView.builder(
               itemCount: data.length,
               itemBuilder: (context, index) {
                 return Dismissible(
                   direction: DismissDirection.startToEnd,
                   key: UniqueKey(),
                   confirmDismiss: (direction) async {
                     final confirm = await showDialog<bool>(
                       context: context,
                       builder: (BuildContext context1) =>
                           AlertDialogWidget(
                             title: 'この問題を削除しますか？',
                             content: removeContent,
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
                   onDismissed: (direction) async {



                    await questionSqfliteDao.deleteQuestionByUuid(data[index].uuid);

                    await questionSqfliteDao.getAllQuestionsFromDatabase();


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
                     onTap: (){

                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  AnswerQuestionPage(data: data[index],)),
                       );
                     },
                     child: Container(
                       width: MediaQuery
                           .of(context)
                           .size
                           .width,
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