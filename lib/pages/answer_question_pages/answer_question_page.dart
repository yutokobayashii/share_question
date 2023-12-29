
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_question/constant/color_constant.dart';
import 'package:share_question/widgets/basic_floating_button.dart';

import '../grade_display_pages/grade_display_page.dart';


class AnswerQuestionPage extends HookConsumerWidget {
  const AnswerQuestionPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    const maxNumber = 15;
    const currentNumber = 3;
    const isOptional = false;
    final selectedOption = useState('選択肢 1');

    final List<String> options = [
      '選択肢 1',
      '選択肢 2',
      '選択肢 3',
      '選択肢 4',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              )
          ),
          title: const Center(child: Text('解答')),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.close,size: 28,),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h,),
              
               Align(
                 alignment: Alignment.center,
                 child: SizedBox(
                   width: MediaQuery.of(context).size.width - 50.w,
                   child: Row(
                    children: [
                      const Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: LinearProgressIndicator(
                            value: currentNumber / maxNumber,
                            valueColor: AlwaysStoppedAnimation<Color>(baseColor),
                            backgroundColor: Colors.black12,
                            minHeight: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text('${currentNumber.toString()}/$maxNumber',
                        style: boldTextStyle,
                      ),
                      ],),
                 ),
               ),
                  SizedBox(height: 30.h,),
                  Text('あああああああああああああああああああああああああああああ',
                    style: boldTextStyle,),
              
                  SizedBox(height: 15.h,),
                  
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width - 50.w,
                    height: 200.h,
                    child: Image.network("https://dist.micres.cyberowl.jp/u/gallery/8408/s/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCT2NTa0FFPSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--177fe61e5cbef8804c81765abb09e65ff4bd914d/q/80/r/1280x1280"),
                  ),

                  isOptional ?
                  OptionalAnswerWidget(options: options, selectedOption: selectedOption)
                      :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('記入欄',
                        style: boldTextStyle,),
                      SizedBox(height: 15.h,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50.w,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          maxLength: 50,
                          cursorColor: baseColor,
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: baseColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: baseColor),
                            ),
                          ),
                          onChanged: (text) {

                          },
                          onSubmitted: (text) {

                          },
                        ),
                      )
                    ],
                  ),



                    SizedBox(height: 100.h,),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: BasicFloatingButtonWidget(
          text: '次へ',
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GradeDisplayPage()),
            );

          },),
      ),
    );
  }
}

class OptionalAnswerWidget extends StatelessWidget {
  const OptionalAnswerWidget({
    super.key,
    required this.options,
    required this.selectedOption,
  });

  final List<String> options;
  final ValueNotifier<String> selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: options.map((String option) {
       return ListTile(
         contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
         title: Text(option,
           style: boldTextStyle,),
         leading: Radio<String>(
         activeColor: baseColor,
         value: option,
         groupValue: selectedOption.value,
         onChanged: (String? value) {
             selectedOption.value = value!;
           },
          ),
         );
        }).toList(),
       );
  }
}
