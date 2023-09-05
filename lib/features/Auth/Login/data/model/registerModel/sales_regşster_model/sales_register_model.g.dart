// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesRegisterModel _$$_SalesRegisterModelFromJson(
        Map<String, dynamic> json) =>
    _$_SalesRegisterModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
      companyPhone: json['companyPhone'] as String?,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_SalesRegisterModelToJson(
        _$_SalesRegisterModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'companyName': instance.companyName,
      'companyPhone': instance.companyPhone,
      'createdAt': _$JsonConverterToJson<dynamic, DateTime>(
          instance.createdAt, const TimestampSerializer().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
