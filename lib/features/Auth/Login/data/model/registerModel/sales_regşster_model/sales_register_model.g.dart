// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesRegisterModel _$$_SalesRegisterModelFromJson(
        Map<String, dynamic> json) =>
    _$_SalesRegisterModel(
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
      companyPhone: json['companyPhone'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_SalesRegisterModelToJson(
        _$_SalesRegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'companyName': instance.companyName,
      'companyPhone': instance.companyPhone,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'createdAt': _$JsonConverterToJson<dynamic, DateTime>(
          instance.createdAt, const TimestampSerializer().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
