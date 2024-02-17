import 'package:freezed_annotation/freezed_annotation.dart';


part 'initial_question.freezed.dart';

part 'initial_question.g.dart';

@freezed
class InitialQuestion with _$InitialQuestion {
  const factory InitialQuestion({
    required String name,
    required String author,
    required String explain,
    required String comment
  }) = _InitialQuestion;

  factory InitialQuestion.fromJson(Map<String, dynamic> json) =>
      _$InitialQuestionFromJson(json);
}

///repository usecase notifierをさくせいす