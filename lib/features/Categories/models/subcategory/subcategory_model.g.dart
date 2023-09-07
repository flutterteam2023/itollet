// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcategoryModel _$$_SubcategoryModelFromJson(Map<String, dynamic> json) =>
    _$_SubcategoryModel(
      name: json['name'] as String?,
      iconUrl: json['iconUrl'] as String?,
      color1: const ColorSerializer().fromJson(json['color1']),
      color2: const ColorSerializer().fromJson(json['color2']),
    );

Map<String, dynamic> _$$_SubcategoryModelToJson(_$_SubcategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'color1': _$JsonConverterToJson<dynamic, Color>(
          instance.color1, const ColorSerializer().toJson),
      'color2': _$JsonConverterToJson<dynamic, Color>(
          instance.color2, const ColorSerializer().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
