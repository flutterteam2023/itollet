// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgorPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgorPasswordStateCopyWith<ForgorPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgorPasswordStateCopyWith<$Res> {
  factory $ForgorPasswordStateCopyWith(
          ForgorPasswordState value, $Res Function(ForgorPasswordState) then) =
      _$ForgorPasswordStateCopyWithImpl<$Res, ForgorPasswordState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$ForgorPasswordStateCopyWithImpl<$Res, $Val extends ForgorPasswordState>
    implements $ForgorPasswordStateCopyWith<$Res> {
  _$ForgorPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgorPasswordStateCopyWith<$Res>
    implements $ForgorPasswordStateCopyWith<$Res> {
  factory _$$_ForgorPasswordStateCopyWith(_$_ForgorPasswordState value,
          $Res Function(_$_ForgorPasswordState) then) =
      __$$_ForgorPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_ForgorPasswordStateCopyWithImpl<$Res>
    extends _$ForgorPasswordStateCopyWithImpl<$Res, _$_ForgorPasswordState>
    implements _$$_ForgorPasswordStateCopyWith<$Res> {
  __$$_ForgorPasswordStateCopyWithImpl(_$_ForgorPasswordState _value,
      $Res Function(_$_ForgorPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_ForgorPasswordState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ForgorPasswordState implements _ForgorPasswordState {
  _$_ForgorPasswordState({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ForgorPasswordState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgorPasswordState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgorPasswordStateCopyWith<_$_ForgorPasswordState> get copyWith =>
      __$$_ForgorPasswordStateCopyWithImpl<_$_ForgorPasswordState>(
          this, _$identity);
}

abstract class _ForgorPasswordState implements ForgorPasswordState {
  factory _ForgorPasswordState({required final bool isLoading}) =
      _$_ForgorPasswordState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ForgorPasswordStateCopyWith<_$_ForgorPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
