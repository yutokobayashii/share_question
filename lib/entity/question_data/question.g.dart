// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      uuid: json['uuid'] as String,
      favorite: json['favorite'] as int?,
      answerNumber: json['answerNumber'] as int?,
      name: json['name'] as String,
      author: json['author'] as String,
      explain: json['explain'] as String,
      comment: json['comment'] as String,
      createdAt: json['createdAt'] as String,
      questionDetailList: (json['questionDetailList'] as List<dynamic>)
          .map((e) => QuestionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'favorite': instance.favorite,
      'answerNumber': instance.answerNumber,
      'name': instance.name,
      'author': instance.author,
      'explain': instance.explain,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'questionDetailList': instance.questionDetailList,
    };

_$QuestionDetailImpl _$$QuestionDetailImplFromJson(Map<String, dynamic> json) =>
    _$QuestionDetailImpl(
      isOptional: json['isOptional'] as bool,
      questionName: json['questionName'] as String,
      image: json['image'] as String,
      correctAnswer: json['correctAnswer'] as String,
      explanation: json['explanation'] as String,
      optionalList: (json['optionalList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$QuestionDetailImplToJson(
        _$QuestionDetailImpl instance) =>
    <String, dynamic>{
      'isOptional': instance.isOptional,
      'questionName': instance.questionName,
      'image': instance.image,
      'correctAnswer': instance.correctAnswer,
      'explanation': instance.explanation,
      'optionalList': instance.optionalList,
    };
