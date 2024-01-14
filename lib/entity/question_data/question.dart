

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/time_stamp_converter.dart';


part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String name,
    required String author,
    required String explain,
    required String comment,
    @TimestampConverter() required DateTime createdAt,
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
    required List<OptionalQuestion> optionalList,
}) = _QuestionDetail;

factory QuestionDetail.fromJson(Map<String, dynamic> json) => _$QuestionDetailFromJson(json);
}



@freezed
class OptionalQuestion with _$OptionalQuestion {
  const factory OptionalQuestion({
    required String optional,

  }) = _OptionalQuestion;

  factory OptionalQuestion.fromJson(Map<String, dynamic> json) => _$OptionalQuestionFromJson(json);
}