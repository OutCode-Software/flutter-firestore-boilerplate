// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) {
  return _BasicResponse.fromJson(json);
}

/// @nodoc
mixin _$BasicResponse {
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicResponseCopyWith<BasicResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicResponseCopyWith<$Res> {
  factory $BasicResponseCopyWith(
          BasicResponse value, $Res Function(BasicResponse) then) =
      _$BasicResponseCopyWithImpl<$Res, BasicResponse>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$BasicResponseCopyWithImpl<$Res, $Val extends BasicResponse>
    implements $BasicResponseCopyWith<$Res> {
  _$BasicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicResponseCopyWith<$Res>
    implements $BasicResponseCopyWith<$Res> {
  factory _$$_BasicResponseCopyWith(
          _$_BasicResponse value, $Res Function(_$_BasicResponse) then) =
      __$$_BasicResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_BasicResponseCopyWithImpl<$Res>
    extends _$BasicResponseCopyWithImpl<$Res, _$_BasicResponse>
    implements _$$_BasicResponseCopyWith<$Res> {
  __$$_BasicResponseCopyWithImpl(
      _$_BasicResponse _value, $Res Function(_$_BasicResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_BasicResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicResponse implements _BasicResponse {
  _$_BasicResponse({this.message});

  factory _$_BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BasicResponseFromJson(json);

  @override
  final String? message;

  @override
  String toString() {
    return 'BasicResponse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicResponse &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicResponseCopyWith<_$_BasicResponse> get copyWith =>
      __$$_BasicResponseCopyWithImpl<_$_BasicResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicResponseToJson(
      this,
    );
  }
}

abstract class _BasicResponse implements BasicResponse {
  factory _BasicResponse({final String? message}) = _$_BasicResponse;

  factory _BasicResponse.fromJson(Map<String, dynamic> json) =
      _$_BasicResponse.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_BasicResponseCopyWith<_$_BasicResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
