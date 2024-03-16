// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inquire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Inquire _$InquireFromJson(Map<String, dynamic> json) {
  return _Inquire.fromJson(json);
}

/// @nodoc
mixin _$Inquire {
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InquireCopyWith<Inquire> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InquireCopyWith<$Res> {
  factory $InquireCopyWith(Inquire value, $Res Function(Inquire) then) =
      _$InquireCopyWithImpl<$Res, Inquire>;
  @useResult
  $Res call({String userId, String content});
}

/// @nodoc
class _$InquireCopyWithImpl<$Res, $Val extends Inquire>
    implements $InquireCopyWith<$Res> {
  _$InquireCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InquireImplCopyWith<$Res> implements $InquireCopyWith<$Res> {
  factory _$$InquireImplCopyWith(
          _$InquireImpl value, $Res Function(_$InquireImpl) then) =
      __$$InquireImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String content});
}

/// @nodoc
class __$$InquireImplCopyWithImpl<$Res>
    extends _$InquireCopyWithImpl<$Res, _$InquireImpl>
    implements _$$InquireImplCopyWith<$Res> {
  __$$InquireImplCopyWithImpl(
      _$InquireImpl _value, $Res Function(_$InquireImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? content = null,
  }) {
    return _then(_$InquireImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InquireImpl implements _Inquire {
  const _$InquireImpl({required this.userId, required this.content});

  factory _$InquireImpl.fromJson(Map<String, dynamic> json) =>
      _$$InquireImplFromJson(json);

  @override
  final String userId;
  @override
  final String content;

  @override
  String toString() {
    return 'Inquire(userId: $userId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InquireImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InquireImplCopyWith<_$InquireImpl> get copyWith =>
      __$$InquireImplCopyWithImpl<_$InquireImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InquireImplToJson(
      this,
    );
  }
}

abstract class _Inquire implements Inquire {
  const factory _Inquire(
      {required final String userId,
      required final String content}) = _$InquireImpl;

  factory _Inquire.fromJson(Map<String, dynamic> json) = _$InquireImpl.fromJson;

  @override
  String get userId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$InquireImplCopyWith<_$InquireImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
