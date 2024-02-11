// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get uuid => throw _privateConstructorUsedError;
  int? get favorite => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get explain => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<QuestionDetail> get questionDetailList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String uuid,
      int? favorite,
      String name,
      String author,
      String explain,
      String comment,
      String createdAt,
      List<QuestionDetail> questionDetailList});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? favorite = freezed,
    Object? name = null,
    Object? author = null,
    Object? explain = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? questionDetailList = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      explain: null == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      questionDetailList: null == questionDetailList
          ? _value.questionDetailList
          : questionDetailList // ignore: cast_nullable_to_non_nullable
              as List<QuestionDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      int? favorite,
      String name,
      String author,
      String explain,
      String comment,
      String createdAt,
      List<QuestionDetail> questionDetailList});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? favorite = freezed,
    Object? name = null,
    Object? author = null,
    Object? explain = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? questionDetailList = null,
  }) {
    return _then(_$QuestionImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      favorite: freezed == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      explain: null == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      questionDetailList: null == questionDetailList
          ? _value._questionDetailList
          : questionDetailList // ignore: cast_nullable_to_non_nullable
              as List<QuestionDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {required this.uuid,
      required this.favorite,
      required this.name,
      required this.author,
      required this.explain,
      required this.comment,
      required this.createdAt,
      required final List<QuestionDetail> questionDetailList})
      : _questionDetailList = questionDetailList;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String uuid;
  @override
  final int? favorite;
  @override
  final String name;
  @override
  final String author;
  @override
  final String explain;
  @override
  final String comment;
  @override
  final String createdAt;
  final List<QuestionDetail> _questionDetailList;
  @override
  List<QuestionDetail> get questionDetailList {
    if (_questionDetailList is EqualUnmodifiableListView)
      return _questionDetailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionDetailList);
  }

  @override
  String toString() {
    return 'Question(uuid: $uuid, favorite: $favorite, name: $name, author: $author, explain: $explain, comment: $comment, createdAt: $createdAt, questionDetailList: $questionDetailList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.explain, explain) || other.explain == explain) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._questionDetailList, _questionDetailList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      favorite,
      name,
      author,
      explain,
      comment,
      createdAt,
      const DeepCollectionEquality().hash(_questionDetailList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {required final String uuid,
      required final int? favorite,
      required final String name,
      required final String author,
      required final String explain,
      required final String comment,
      required final String createdAt,
      required final List<QuestionDetail> questionDetailList}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get uuid;
  @override
  int? get favorite;
  @override
  String get name;
  @override
  String get author;
  @override
  String get explain;
  @override
  String get comment;
  @override
  String get createdAt;
  @override
  List<QuestionDetail> get questionDetailList;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionDetail _$QuestionDetailFromJson(Map<String, dynamic> json) {
  return _QuestionDetail.fromJson(json);
}

/// @nodoc
mixin _$QuestionDetail {
  bool get isOptional => throw _privateConstructorUsedError;
  String get questionName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get correctAnswer => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  List<OptionalQuestion> get optionalList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionDetailCopyWith<QuestionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDetailCopyWith<$Res> {
  factory $QuestionDetailCopyWith(
          QuestionDetail value, $Res Function(QuestionDetail) then) =
      _$QuestionDetailCopyWithImpl<$Res, QuestionDetail>;
  @useResult
  $Res call(
      {bool isOptional,
      String questionName,
      String image,
      String correctAnswer,
      String explanation,
      List<OptionalQuestion> optionalList});
}

/// @nodoc
class _$QuestionDetailCopyWithImpl<$Res, $Val extends QuestionDetail>
    implements $QuestionDetailCopyWith<$Res> {
  _$QuestionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOptional = null,
    Object? questionName = null,
    Object? image = null,
    Object? correctAnswer = null,
    Object? explanation = null,
    Object? optionalList = null,
  }) {
    return _then(_value.copyWith(
      isOptional: null == isOptional
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      questionName: null == questionName
          ? _value.questionName
          : questionName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      optionalList: null == optionalList
          ? _value.optionalList
          : optionalList // ignore: cast_nullable_to_non_nullable
              as List<OptionalQuestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionDetailImplCopyWith<$Res>
    implements $QuestionDetailCopyWith<$Res> {
  factory _$$QuestionDetailImplCopyWith(_$QuestionDetailImpl value,
          $Res Function(_$QuestionDetailImpl) then) =
      __$$QuestionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOptional,
      String questionName,
      String image,
      String correctAnswer,
      String explanation,
      List<OptionalQuestion> optionalList});
}

/// @nodoc
class __$$QuestionDetailImplCopyWithImpl<$Res>
    extends _$QuestionDetailCopyWithImpl<$Res, _$QuestionDetailImpl>
    implements _$$QuestionDetailImplCopyWith<$Res> {
  __$$QuestionDetailImplCopyWithImpl(
      _$QuestionDetailImpl _value, $Res Function(_$QuestionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOptional = null,
    Object? questionName = null,
    Object? image = null,
    Object? correctAnswer = null,
    Object? explanation = null,
    Object? optionalList = null,
  }) {
    return _then(_$QuestionDetailImpl(
      isOptional: null == isOptional
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      questionName: null == questionName
          ? _value.questionName
          : questionName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      optionalList: null == optionalList
          ? _value._optionalList
          : optionalList // ignore: cast_nullable_to_non_nullable
              as List<OptionalQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionDetailImpl implements _QuestionDetail {
  const _$QuestionDetailImpl(
      {required this.isOptional,
      required this.questionName,
      required this.image,
      required this.correctAnswer,
      required this.explanation,
      required final List<OptionalQuestion> optionalList})
      : _optionalList = optionalList;

  factory _$QuestionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionDetailImplFromJson(json);

  @override
  final bool isOptional;
  @override
  final String questionName;
  @override
  final String image;
  @override
  final String correctAnswer;
  @override
  final String explanation;
  final List<OptionalQuestion> _optionalList;
  @override
  List<OptionalQuestion> get optionalList {
    if (_optionalList is EqualUnmodifiableListView) return _optionalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionalList);
  }

  @override
  String toString() {
    return 'QuestionDetail(isOptional: $isOptional, questionName: $questionName, image: $image, correctAnswer: $correctAnswer, explanation: $explanation, optionalList: $optionalList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDetailImpl &&
            (identical(other.isOptional, isOptional) ||
                other.isOptional == isOptional) &&
            (identical(other.questionName, questionName) ||
                other.questionName == questionName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            const DeepCollectionEquality()
                .equals(other._optionalList, _optionalList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isOptional,
      questionName,
      image,
      correctAnswer,
      explanation,
      const DeepCollectionEquality().hash(_optionalList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDetailImplCopyWith<_$QuestionDetailImpl> get copyWith =>
      __$$QuestionDetailImplCopyWithImpl<_$QuestionDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionDetailImplToJson(
      this,
    );
  }
}

abstract class _QuestionDetail implements QuestionDetail {
  const factory _QuestionDetail(
          {required final bool isOptional,
          required final String questionName,
          required final String image,
          required final String correctAnswer,
          required final String explanation,
          required final List<OptionalQuestion> optionalList}) =
      _$QuestionDetailImpl;

  factory _QuestionDetail.fromJson(Map<String, dynamic> json) =
      _$QuestionDetailImpl.fromJson;

  @override
  bool get isOptional;
  @override
  String get questionName;
  @override
  String get image;
  @override
  String get correctAnswer;
  @override
  String get explanation;
  @override
  List<OptionalQuestion> get optionalList;
  @override
  @JsonKey(ignore: true)
  _$$QuestionDetailImplCopyWith<_$QuestionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptionalQuestion _$OptionalQuestionFromJson(Map<String, dynamic> json) {
  return _OptionalQuestion.fromJson(json);
}

/// @nodoc
mixin _$OptionalQuestion {
  String get optional => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionalQuestionCopyWith<OptionalQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionalQuestionCopyWith<$Res> {
  factory $OptionalQuestionCopyWith(
          OptionalQuestion value, $Res Function(OptionalQuestion) then) =
      _$OptionalQuestionCopyWithImpl<$Res, OptionalQuestion>;
  @useResult
  $Res call({String optional});
}

/// @nodoc
class _$OptionalQuestionCopyWithImpl<$Res, $Val extends OptionalQuestion>
    implements $OptionalQuestionCopyWith<$Res> {
  _$OptionalQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optional = null,
  }) {
    return _then(_value.copyWith(
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionalQuestionImplCopyWith<$Res>
    implements $OptionalQuestionCopyWith<$Res> {
  factory _$$OptionalQuestionImplCopyWith(_$OptionalQuestionImpl value,
          $Res Function(_$OptionalQuestionImpl) then) =
      __$$OptionalQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String optional});
}

/// @nodoc
class __$$OptionalQuestionImplCopyWithImpl<$Res>
    extends _$OptionalQuestionCopyWithImpl<$Res, _$OptionalQuestionImpl>
    implements _$$OptionalQuestionImplCopyWith<$Res> {
  __$$OptionalQuestionImplCopyWithImpl(_$OptionalQuestionImpl _value,
      $Res Function(_$OptionalQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optional = null,
  }) {
    return _then(_$OptionalQuestionImpl(
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionalQuestionImpl implements _OptionalQuestion {
  const _$OptionalQuestionImpl({required this.optional});

  factory _$OptionalQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionalQuestionImplFromJson(json);

  @override
  final String optional;

  @override
  String toString() {
    return 'OptionalQuestion(optional: $optional)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionalQuestionImpl &&
            (identical(other.optional, optional) ||
                other.optional == optional));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, optional);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionalQuestionImplCopyWith<_$OptionalQuestionImpl> get copyWith =>
      __$$OptionalQuestionImplCopyWithImpl<_$OptionalQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionalQuestionImplToJson(
      this,
    );
  }
}

abstract class _OptionalQuestion implements OptionalQuestion {
  const factory _OptionalQuestion({required final String optional}) =
      _$OptionalQuestionImpl;

  factory _OptionalQuestion.fromJson(Map<String, dynamic> json) =
      _$OptionalQuestionImpl.fromJson;

  @override
  String get optional;
  @override
  @JsonKey(ignore: true)
  _$$OptionalQuestionImplCopyWith<_$OptionalQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
