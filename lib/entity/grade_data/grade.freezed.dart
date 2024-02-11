// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Grade _$GradeFromJson(Map<String, dynamic> json) {
  return _Grade.fromJson(json);
}

/// @nodoc
mixin _$Grade {
  String get uuid => throw _privateConstructorUsedError;
  String? get documentId => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get lastDate => throw _privateConstructorUsedError;
  int get questionNumber => throw _privateConstructorUsedError;
  int get correctNumber => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  List<GradeDetail> get gradeDetailList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GradeCopyWith<Grade> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeCopyWith<$Res> {
  factory $GradeCopyWith(Grade value, $Res Function(Grade) then) =
      _$GradeCopyWithImpl<$Res, Grade>;
  @useResult
  $Res call(
      {String uuid,
      String? documentId,
      bool isLiked,
      String name,
      String author,
      String lastDate,
      int questionNumber,
      int correctNumber,
      String comment,
      List<GradeDetail> gradeDetailList});
}

/// @nodoc
class _$GradeCopyWithImpl<$Res, $Val extends Grade>
    implements $GradeCopyWith<$Res> {
  _$GradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? documentId = freezed,
    Object? isLiked = null,
    Object? name = null,
    Object? author = null,
    Object? lastDate = null,
    Object? questionNumber = null,
    Object? correctNumber = null,
    Object? comment = null,
    Object? gradeDetailList = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      lastDate: null == lastDate
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as String,
      questionNumber: null == questionNumber
          ? _value.questionNumber
          : questionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      correctNumber: null == correctNumber
          ? _value.correctNumber
          : correctNumber // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      gradeDetailList: null == gradeDetailList
          ? _value.gradeDetailList
          : gradeDetailList // ignore: cast_nullable_to_non_nullable
              as List<GradeDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeImplCopyWith<$Res> implements $GradeCopyWith<$Res> {
  factory _$$GradeImplCopyWith(
          _$GradeImpl value, $Res Function(_$GradeImpl) then) =
      __$$GradeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String? documentId,
      bool isLiked,
      String name,
      String author,
      String lastDate,
      int questionNumber,
      int correctNumber,
      String comment,
      List<GradeDetail> gradeDetailList});
}

/// @nodoc
class __$$GradeImplCopyWithImpl<$Res>
    extends _$GradeCopyWithImpl<$Res, _$GradeImpl>
    implements _$$GradeImplCopyWith<$Res> {
  __$$GradeImplCopyWithImpl(
      _$GradeImpl _value, $Res Function(_$GradeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? documentId = freezed,
    Object? isLiked = null,
    Object? name = null,
    Object? author = null,
    Object? lastDate = null,
    Object? questionNumber = null,
    Object? correctNumber = null,
    Object? comment = null,
    Object? gradeDetailList = null,
  }) {
    return _then(_$GradeImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      lastDate: null == lastDate
          ? _value.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as String,
      questionNumber: null == questionNumber
          ? _value.questionNumber
          : questionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      correctNumber: null == correctNumber
          ? _value.correctNumber
          : correctNumber // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      gradeDetailList: null == gradeDetailList
          ? _value._gradeDetailList
          : gradeDetailList // ignore: cast_nullable_to_non_nullable
              as List<GradeDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeImpl implements _Grade {
  const _$GradeImpl(
      {required this.uuid,
      required this.documentId,
      required this.isLiked,
      required this.name,
      required this.author,
      required this.lastDate,
      required this.questionNumber,
      required this.correctNumber,
      required this.comment,
      required final List<GradeDetail> gradeDetailList})
      : _gradeDetailList = gradeDetailList;

  factory _$GradeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeImplFromJson(json);

  @override
  final String uuid;
  @override
  final String? documentId;
  @override
  final bool isLiked;
  @override
  final String name;
  @override
  final String author;
  @override
  final String lastDate;
  @override
  final int questionNumber;
  @override
  final int correctNumber;
  @override
  final String comment;
  final List<GradeDetail> _gradeDetailList;
  @override
  List<GradeDetail> get gradeDetailList {
    if (_gradeDetailList is EqualUnmodifiableListView) return _gradeDetailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gradeDetailList);
  }

  @override
  String toString() {
    return 'Grade(uuid: $uuid, documentId: $documentId, isLiked: $isLiked, name: $name, author: $author, lastDate: $lastDate, questionNumber: $questionNumber, correctNumber: $correctNumber, comment: $comment, gradeDetailList: $gradeDetailList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.lastDate, lastDate) ||
                other.lastDate == lastDate) &&
            (identical(other.questionNumber, questionNumber) ||
                other.questionNumber == questionNumber) &&
            (identical(other.correctNumber, correctNumber) ||
                other.correctNumber == correctNumber) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality()
                .equals(other._gradeDetailList, _gradeDetailList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      documentId,
      isLiked,
      name,
      author,
      lastDate,
      questionNumber,
      correctNumber,
      comment,
      const DeepCollectionEquality().hash(_gradeDetailList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeImplCopyWith<_$GradeImpl> get copyWith =>
      __$$GradeImplCopyWithImpl<_$GradeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeImplToJson(
      this,
    );
  }
}

abstract class _Grade implements Grade {
  const factory _Grade(
      {required final String uuid,
      required final String? documentId,
      required final bool isLiked,
      required final String name,
      required final String author,
      required final String lastDate,
      required final int questionNumber,
      required final int correctNumber,
      required final String comment,
      required final List<GradeDetail> gradeDetailList}) = _$GradeImpl;

  factory _Grade.fromJson(Map<String, dynamic> json) = _$GradeImpl.fromJson;

  @override
  String get uuid;
  @override
  String? get documentId;
  @override
  bool get isLiked;
  @override
  String get name;
  @override
  String get author;
  @override
  String get lastDate;
  @override
  int get questionNumber;
  @override
  int get correctNumber;
  @override
  String get comment;
  @override
  List<GradeDetail> get gradeDetailList;
  @override
  @JsonKey(ignore: true)
  _$$GradeImplCopyWith<_$GradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GradeDetail _$GradeDetailFromJson(Map<String, dynamic> json) {
  return _GradeDetail.fromJson(json);
}

/// @nodoc
mixin _$GradeDetail {
  String get questionName => throw _privateConstructorUsedError;
  String get correct => throw _privateConstructorUsedError;
  String get yourAnswer => throw _privateConstructorUsedError;
  String get explain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GradeDetailCopyWith<GradeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeDetailCopyWith<$Res> {
  factory $GradeDetailCopyWith(
          GradeDetail value, $Res Function(GradeDetail) then) =
      _$GradeDetailCopyWithImpl<$Res, GradeDetail>;
  @useResult
  $Res call(
      {String questionName, String correct, String yourAnswer, String explain});
}

/// @nodoc
class _$GradeDetailCopyWithImpl<$Res, $Val extends GradeDetail>
    implements $GradeDetailCopyWith<$Res> {
  _$GradeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionName = null,
    Object? correct = null,
    Object? yourAnswer = null,
    Object? explain = null,
  }) {
    return _then(_value.copyWith(
      questionName: null == questionName
          ? _value.questionName
          : questionName // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      yourAnswer: null == yourAnswer
          ? _value.yourAnswer
          : yourAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      explain: null == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GradeDetailImplCopyWith<$Res>
    implements $GradeDetailCopyWith<$Res> {
  factory _$$GradeDetailImplCopyWith(
          _$GradeDetailImpl value, $Res Function(_$GradeDetailImpl) then) =
      __$$GradeDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String questionName, String correct, String yourAnswer, String explain});
}

/// @nodoc
class __$$GradeDetailImplCopyWithImpl<$Res>
    extends _$GradeDetailCopyWithImpl<$Res, _$GradeDetailImpl>
    implements _$$GradeDetailImplCopyWith<$Res> {
  __$$GradeDetailImplCopyWithImpl(
      _$GradeDetailImpl _value, $Res Function(_$GradeDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionName = null,
    Object? correct = null,
    Object? yourAnswer = null,
    Object? explain = null,
  }) {
    return _then(_$GradeDetailImpl(
      questionName: null == questionName
          ? _value.questionName
          : questionName // ignore: cast_nullable_to_non_nullable
              as String,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      yourAnswer: null == yourAnswer
          ? _value.yourAnswer
          : yourAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      explain: null == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeDetailImpl implements _GradeDetail {
  const _$GradeDetailImpl(
      {required this.questionName,
      required this.correct,
      required this.yourAnswer,
      required this.explain});

  factory _$GradeDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeDetailImplFromJson(json);

  @override
  final String questionName;
  @override
  final String correct;
  @override
  final String yourAnswer;
  @override
  final String explain;

  @override
  String toString() {
    return 'GradeDetail(questionName: $questionName, correct: $correct, yourAnswer: $yourAnswer, explain: $explain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeDetailImpl &&
            (identical(other.questionName, questionName) ||
                other.questionName == questionName) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.yourAnswer, yourAnswer) ||
                other.yourAnswer == yourAnswer) &&
            (identical(other.explain, explain) || other.explain == explain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionName, correct, yourAnswer, explain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeDetailImplCopyWith<_$GradeDetailImpl> get copyWith =>
      __$$GradeDetailImplCopyWithImpl<_$GradeDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeDetailImplToJson(
      this,
    );
  }
}

abstract class _GradeDetail implements GradeDetail {
  const factory _GradeDetail(
      {required final String questionName,
      required final String correct,
      required final String yourAnswer,
      required final String explain}) = _$GradeDetailImpl;

  factory _GradeDetail.fromJson(Map<String, dynamic> json) =
      _$GradeDetailImpl.fromJson;

  @override
  String get questionName;
  @override
  String get correct;
  @override
  String get yourAnswer;
  @override
  String get explain;
  @override
  @JsonKey(ignore: true)
  _$$GradeDetailImplCopyWith<_$GradeDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
