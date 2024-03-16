import 'package:freezed_annotation/freezed_annotation.dart';

part 'inquire.freezed.dart';

part 'inquire.g.dart';

@freezed
class Inquire with _$Inquire {
  const factory Inquire({
    required String userId,
    required String content,

  }) = _Inquire;

  factory Inquire.fromJson(Map<String, dynamic> json) =>
      _$InquireFromJson(json);
}