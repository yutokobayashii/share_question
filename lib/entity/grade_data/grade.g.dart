// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GradeImpl _$$GradeImplFromJson(Map<String, dynamic> json) => _$GradeImpl(
      name: json['name'] as String,
      author: json['author'] as String,
      lastDate: json['lastDate'] as String,
      questionNumber: json['questionNumber'] as int,
      correctNumber: json['correctNumber'] as int,
      comment: json['comment'] as String,
      gradeDetailList: (json['gradeDetailList'] as List<dynamic>)
          .map((e) => GradeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GradeImplToJson(_$GradeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'author': instance.author,
      'lastDate': instance.lastDate,
      'questionNumber': instance.questionNumber,
      'correctNumber': instance.correctNumber,
      'comment': instance.comment,
      'gradeDetailList': instance.gradeDetailList,
    };

_$GradeDetailImpl _$$GradeDetailImplFromJson(Map<String, dynamic> json) =>
    _$GradeDetailImpl(
      questionName: json['questionName'] as String,
      correct: json['correct'] as String,
      yourAnswer: json['yourAnswer'] as String,
      explain: json['explain'] as String,
    );

Map<String, dynamic> _$$GradeDetailImplToJson(_$GradeDetailImpl instance) =>
    <String, dynamic>{
      'questionName': instance.questionName,
      'correct': instance.correct,
      'yourAnswer': instance.yourAnswer,
      'explain': instance.explain,
    };
