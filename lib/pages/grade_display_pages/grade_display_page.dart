import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/notifier/cloud_firestore_notifier/cloud_firestore_notifier.dart';
import 'package:share_question/notifier/grade/grade_notifier.dart';
import 'package:share_question/pages/grade_display_pages/question_result_list_widget.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../../constant/style.dart';
import '../../data/local/color_shared_preference_service.dart';
import '../../entity/grade_data/grade.dart';
import '../../util/snackbar.dart';

class GradeDisplayPage extends HookConsumerWidget {
  const GradeDisplayPage({
    super.key,
    required this.isFromGradePage,
    required this.gradeData,
  });

  final bool isFromGradePage;
  final Grade gradeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int score = gradeData.correctNumber;
    final int total = gradeData.questionNumber;
    double percentage = score / total;
    final documentId = useState("");
    final isLiked = useState<bool>(false);

    useEffect(() {
      // 非同期処理を実行する関数
      Future<void> fetchData() async {
        try {
          // ここに非同期処理を書く。例えば外部APIからデータを取得する等
          String? result = await ref
              .read(cloudFireStoreNotifierProvider.notifier)
              .getDocumentIdByUuid(gradeData.uuid);
          // 非同期処理の結果をuseStateを使って保持する状態にセット
          documentId.value = result ?? "";
        } catch (e) {
          // エラーハンドリング
          debugPrint(e.toString());
        }
      }

      fetchData();

      return null;
    }, []);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(gradeData.name),
          centerTitle: true,
          leading: (isFromGradePage)
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                  ))
              : Opacity(opacity: 0, child: Container()),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: PieChart(
                            PieChartData(
                              startDegreeOffset: -90,
                              sections: [
                                PieChartSectionData(
                                  color:
                                      ColorSharedPreferenceService().getColor(),
                                  value: percentage * 100,
                                  title: '',
                                  radius: 20,
                                ),
                                PieChartSectionData(
                                  color: Colors.black12,
                                  value: (1 - percentage) * 100,
                                  title: '',
                                  radius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '${(percentage * 100).toStringAsFixed(1)}%',
                          // テキストでパーセンテージを表示
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '作成者からのコメント',
                          style: boldTextStyle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          gradeData.comment,
                          style: normalTextStyle,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  (gradeData.isLiked)
                      ? const SizedBox()

                      ///一回しか謳歌できない状態にする。
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '「いいね」を送る',
                                style: boldTextStyle,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: (isLiked.value)
                                    ? () {}
                                    : () async {
                                        isLiked.value = true;

                                        displayErrorSnackBar(ref,context,"いいねを送信しました。");

                                        await ref
                                            .watch(
                                                cloudFireStoreNotifierProvider
                                                    .notifier)
                                            .incrementLikes(documentId.value);

                                        await ref
                                            .watch(gradeListNotifierProvider
                                                .notifier)
                                            .updateGradeToDatabaseForIsLiked(
                                                gradeData);
                                        //documentIdは
                                      },
                                child: Icon(
                                  (isLiked.value)
                                      ? Icons.star
                                      : Icons.star_outline,
                                  size: 35,
                                  color:
                                      ColorSharedPreferenceService().getColor(),
                                ),
                              )
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '解答結果',
                      style: boldTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  QuestionResultListWidget(
                    data: gradeData,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: (isFromGradePage)
            ? const SizedBox()
            : BasicFloatingButtonWidget(
                text: '戻る',
                action: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  ref.invalidate(gradeListNotifierProvider);
                },
              ),
      ),
    );
  }
}
