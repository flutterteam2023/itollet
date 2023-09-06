// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesRegisterModel _$SalesRegisterModelFromJson(Map<String, dynamic> json) {
  return _SalesRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$SalesRegisterModel {
  String? get email => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  String? get companyPhone => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get rePassword => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesRegisterModelCopyWith<SalesRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesRegisterModelCopyWith<$Res> {
  factory $SalesRegisterModelCopyWith(
          SalesRegisterModel value, $Res Function(SalesRegisterModel) then) =
      _$SalesRegisterModelCopyWithImpl<$Res, SalesRegisterModel>;
  @useResult
  $Res call(
      {String? email,
      String? companyName,
      String? companyPhone,
      String? password,
      String? rePassword,
      @TimestampSerializer() DateTime? createdAt});
}

/// @nodoc
class _$SalesRegisterModelCopyWithImpl<$Res, $Val extends SalesRegisterModel>
    implements $SalesRegisterModelCopyWith<$Res> {
  _$SalesRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? companyName = freezed,
    Object? companyPhone = freezed,
    Object? password = freezed,
    Object? rePassword = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyPhone: freezed == companyPhone
          ? _value.companyPhone
          : companyPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      rePassword: freezed == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesRegisterModelCopyWith<$Res>
    implements $SalesRegisterModelCopyWith<$Res> {
  factory _$$_SalesRegisterModelCopyWith(_$_SalesRegisterModel value,
          $Res Function(_$_SalesRegisterModel) then) =
      __$$_SalesRegisterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? companyName,
      String? companyPhone,
      String? password,
      String? rePassword,
      @TimestampSerializer() DateTime? createdAt});
}

/// @nodoc
class __$$_SalesRegisterModelCopyWithImpl<$Res>
    extends _$SalesRegisterModelCopyWithImpl<$Res, _$_SalesRegisterModel>
    implements _$$_SalesRegisterModelCopyWith<$Res> {
  __$$_SalesRegisterModelCopyWithImpl(
      _$_SalesRegisterModel _value, $Res Function(_$_SalesRegisterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? companyName = freezed,
    Object? companyPhone = freezed,
    Object? password = freezed,
    Object? rePassword = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_SalesRegisterModel(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyPhone: freezed == companyPhone
          ? _value.companyPhone
          : companyPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      rePassword: freezed == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesRegisterModel implements _SalesRegisterModel {
  const _$_SalesRegisterModel(
      {required this.email,
      required this.companyName,
      required this.companyPhone,
      required this.password,
      required this.rePassword,
      @TimestampSerializer() required this.createdAt});

  factory _$_SalesRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$$_SalesRegisterModelFromJson(json);

  @override
  final String? email;
  @override
  final String? companyName;
  @override
  final String? companyPhone;
  @override
  final String? password;
  @override
  final String? rePassword;
  @override
  @TimestampSerializer()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'SalesRegisterModel(email: $email, companyName: $companyName, companyPhone: $companyPhone, password: $password, rePassword: $rePassword, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesRegisterModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyPhone, companyPhone) ||
                other.companyPhone == companyPhone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rePassword, rePassword) ||
                other.rePassword == rePassword) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, companyName, companyPhone,
      password, rePassword, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesRegisterModelCopyWith<_$_SalesRegisterModel> get copyWith =>
      __$$_SalesRegisterModelCopyWithImpl<_$_SalesRegisterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesRegisterModelToJson(
      this,
    );
  }
}

abstract class _SalesRegisterModel implements SalesRegisterModel {
  const factory _SalesRegisterModel(
          {required final String? email,
          required final String? companyName,
          required final String? companyPhone,
          required final String? password,
          required final String? rePassword,
          @TimestampSerializer() required final DateTime? createdAt}) =
      _$_SalesRegisterModel;

  factory _SalesRegisterModel.fromJson(Map<String, dynamic> json) =
      _$_SalesRegisterModel.fromJson;

  @override
  String? get email;
  @override
  String? get companyName;
  @override
  String? get companyPhone;
  @override
  String? get password;
  @override
  String? get rePassword;
  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_SalesRegisterModelCopyWith<_$_SalesRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
