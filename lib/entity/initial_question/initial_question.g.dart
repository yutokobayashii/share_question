// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitialQuestionImpl _$$InitialQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$InitialQuestionImpl(
      name: json['name'] as String,
      author: json['author'] as String,
      explain: json['explain'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$InitialQuestionImplToJson(
        _$InitialQuestionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'author': instance.author,
      'explain': instance.explain,
      'comment': instance.comment,
    };
