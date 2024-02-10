// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarDataImpl _$$CalendarDataImplFromJson(Map<String, dynamic> json) =>
    _$CalendarDataImpl(
      time: DateTime.parse(json['time'] as String),
      grade: Grade.fromJson(json['grade'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CalendarDataImplToJson(_$CalendarDataImpl instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'grade': instance.grade,
    };
