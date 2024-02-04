
import 'package:freezed_annotation/freezed_annotation.dart';



part 'grade.freezed.dart';
part 'grade.g.dart';

@freezed
class Grade with _$Grade {
  const factory Grade({
    required String uuid,
    required String name,
    required String author,
    required String lastDate,
    required int questionNumber,
    required int correctNumber,
    required String comment,
    required List<GradeDetail> gradeDetailList,
  }) = _Grade;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);
}


@freezed
class GradeDetail with _$GradeDetail {
  const factory GradeDetail({
    required String questionName,
    required String correct,
    required String yourAnswer,
    required String explain,

  }) = _GradeDetail;

  factory GradeDetail.fromJson(Map<String, dynamic> json) => _$GradeDetailFromJson(json);
}