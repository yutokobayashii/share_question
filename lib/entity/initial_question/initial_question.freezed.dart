// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initial_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitialQuestion _$InitialQuestionFromJson(Map<String, dynamic> json) {
  return _InitialQuestion.fromJson(json);
}

/// @nodoc
mixin _$InitialQuestion {
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get explain => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitialQuestionCopyWith<InitialQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialQuestionCopyWith<$Res> {
  factory $InitialQuestionCopyWith(
          InitialQuestion value, $Res Function(InitialQuestion) then) =
      _$InitialQuestionCopyWithImpl<$Res, InitialQuestion>;
  @useResult
  $Res call({String name, String author, String explain, String comment});
}

/// @nodoc
class _$InitialQuestionCopyWithImpl<$Res, $Val extends InitialQuestion>
    implements $InitialQuestionCopyWith<$Res> {
  _$InitialQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? author = null,
    Object? explain = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialQuestionImplCopyWith<$Res>
    implements $InitialQuestionCopyWith<$Res> {
  factory _$$InitialQuestionImplCopyWith(_$InitialQuestionImpl value,
          $Res Function(_$InitialQuestionImpl) then) =
      __$$InitialQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String author, String explain, String comment});
}

/// @nodoc
class __$$InitialQuestionImplCopyWithImpl<$Res>
    extends _$InitialQuestionCopyWithImpl<$Res, _$InitialQuestionImpl>
    implements _$$InitialQuestionImplCopyWith<$Res> {
  __$$InitialQuestionImplCopyWithImpl(
      _$InitialQuestionImpl _value, $Res Function(_$InitialQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? author = null,
    Object? explain = null,
    Object? comment = null,
  }) {
    return _then(_$InitialQuestionImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitialQuestionImpl implements _InitialQuestion {
  const _$InitialQuestionImpl(
      {required this.name,
      required this.author,
      required this.explain,
      required this.comment});

  factory _$InitialQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitialQuestionImplFromJson(json);

  @override
  final String name;
  @override
  final String author;
  @override
  final String explain;
  @override
  final String comment;

  @override
  String toString() {
    return 'InitialQuestion(name: $name, author: $author, explain: $explain, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialQuestionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.explain, explain) || other.explain == explain) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, author, explain, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialQuestionImplCopyWith<_$InitialQuestionImpl> get copyWith =>
      __$$InitialQuestionImplCopyWithImpl<_$InitialQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitialQuestionImplToJson(
      this,
    );
  }
}

abstract class _InitialQuestion implements InitialQuestion {
  const factory _InitialQuestion(
      {required final String name,
      required final String author,
      required final String explain,
      required final String comment}) = _$InitialQuestionImpl;

  factory _InitialQuestion.fromJson(Map<String, dynamic> json) =
      _$InitialQuestionImpl.fromJson;

  @override
  String get name;
  @override
  String get author;
  @override
  String get explain;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$InitialQuestionImplCopyWith<_$InitialQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
