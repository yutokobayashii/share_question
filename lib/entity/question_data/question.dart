

import 'package:freezed_annotation/freezed_annotation.dart';



part 'question.freezed.dart';
part 'question.g.dart';
@freezed
class Question with _$Question {
  const factory Question({
    required String uuid,
    required int? favorite,
    required int? answerNumber,
    required String name,
    required String author,
    required String explain,
    required String comment,
    required String createdAt,
    required List<QuestionDetail> questionDetailList,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}




@freezed
class QuestionDetail with _$QuestionDetail {
  const factory QuestionDetail({
    required bool isOptional,
    required String questionName,
    required String image,
    required String correctAnswer,
    required String explanation,
    required List<String> optionalList,
}) = _QuestionDetail;

factory QuestionDetail.fromJson(Map<String, dynamic> json) => _$QuestionDetailFromJson(json);
}

