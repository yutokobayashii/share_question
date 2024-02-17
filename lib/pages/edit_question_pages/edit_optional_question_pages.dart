// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../data/local/color_shared_preference_service.dart';
// import '../../widgets/base_textfield_widget.dart';
//
// class EditOptionalQuestionPages extends HookConsumerWidget {
//   const EditOptionalQuestionPages({
//     super.key,
//     required this.questionNumber
//   });
//
//   final int questionNumber;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar:AppBar(
//         backgroundColor: Colors.white,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//             child: const Icon(Icons.arrow_back_ios)),
//         title: Text('$questionNumber問目'),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 30.h,),
//               BaseTextFieldWidget(
//                 title: '問題',
//                 maxLength: 100,
//                 height: 70.h,
//                 controller: TextEditingController(),
//                 onChanged: (text) {},
//                 onSubmitted: (text) {},
//               ),
//
//               (ref.watch(MakeQuestionProvider
//                   .imageFileProvider) !=
//                   null)
//                   ? Column(
//                 children: [
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       color: Colors.white,
//                       width: 250.w,
//                       height: 200.h,
//                       child: Stack(
//                         children: [
//                           Image.file(
//                             File(ref
//                                 .watch(MakeQuestionProvider
//                                 .imageFileProvider)!
//                                 .path),
//                             fit: BoxFit.contain,
//                           ),
//                           Positioned(
//                             top: 0, // Containerの外側に配置
//                             right: 0, // Containerの外側に配置
//                             child: GestureDetector(
//                               onTap: () {
//                                 ref
//                                     .watch(
//                                     MakeQuestionProvider
//                                         .imageFileProvider
//                                         .notifier)
//                                     .update(
//                                         (state) => null);
//                                 ref
//                                     .watch(
//                                     MakeQuestionProvider
//                                         .imageProvider
//                                         .notifier)
//                                     .update((state) => "");
//                               },
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                     border: Border.all(
//                                       color:
//                                       ColorSharedPreferenceService()
//                                           .getColor(),
//                                       width: 1,
//                                     ),
//                                   ),
//                                   child: Icon(
//                                     Icons.close,
//                                     color:
//                                     ColorSharedPreferenceService()
//                                         .getColor(),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//                   : const SizedBox(),
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }
