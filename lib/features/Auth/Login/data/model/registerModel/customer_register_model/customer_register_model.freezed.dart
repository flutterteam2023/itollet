// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerRegisterModel _$CustomerRegisterModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerRegisterModel {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get rePassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerRegisterModelCopyWith<CustomerRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerRegisterModelCopyWith<$Res> {
  factory $CustomerRegisterModelCopyWith(CustomerRegisterModel value,
          $Res Function(CustomerRegisterModel) then) =
      _$CustomerRegisterModelCopyWithImpl<$Res, CustomerRegisterModel>;
  @useResult
  $Res call({String? email, String? password, String? rePassword});
}

/// @nodoc
class _$CustomerRegisterModelCopyWithImpl<$Res,
        $Val extends CustomerRegisterModel>
    implements $CustomerRegisterModelCopyWith<$Res> {
  _$CustomerRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? rePassword = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      rePassword: freezed == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerRegisterModelCopyWith<$Res>
    implements $CustomerRegisterModelCopyWith<$Res> {
  factory _$$_CustomerRegisterModelCopyWith(_$_CustomerRegisterModel value,
          $Res Function(_$_CustomerRegisterModel) then) =
      __$$_CustomerRegisterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? password, String? rePassword});
}

/// @nodoc
class __$$_CustomerRegisterModelCopyWithImpl<$Res>
    extends _$CustomerRegisterModelCopyWithImpl<$Res, _$_CustomerRegisterModel>
    implements _$$_CustomerRegisterModelCopyWith<$Res> {
  __$$_CustomerRegisterModelCopyWithImpl(_$_CustomerRegisterModel _value,
      $Res Function(_$_CustomerRegisterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? rePassword = freezed,
  }) {
    return _then(_$_CustomerRegisterModel(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      rePassword: freezed == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerRegisterModel implements _CustomerRegisterModel {
  const _$_CustomerRegisterModel(
      {required this.email, required this.password, required this.rePassword});

  factory _$_CustomerRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerRegisterModelFromJson(json);

  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? rePassword;

  @override
  String toString() {
    return 'CustomerRegisterModel(email: $email, password: $password, rePassword: $rePassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerRegisterModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rePassword, rePassword) ||
                other.rePassword == rePassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, rePassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerRegisterModelCopyWith<_$_CustomerRegisterModel> get copyWith =>
      __$$_CustomerRegisterModelCopyWithImpl<_$_CustomerRegisterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerRegisterModelToJson(
      this,
    );
  }
}

abstract class _CustomerRegisterModel implements CustomerRegisterModel {
  const factory _CustomerRegisterModel(
      {required final String? email,
      required final String? password,
      required final String? rePassword}) = _$_CustomerRegisterModel;

  factory _CustomerRegisterModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerRegisterModel.fromJson;

  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get rePassword;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerRegisterModelCopyWith<_$_CustomerRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
