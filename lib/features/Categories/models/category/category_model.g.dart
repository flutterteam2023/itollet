// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      name: json['name'] as String?,
      iconUrl: json['iconUrl'] as String?,
      orderBy: json['orderBy'] as int? ?? 0,
      primaryColor: const ColorSerializer().fromJson(json['primaryColor']),
      secondaryColor: const ColorSerializer().fromJson(json['secondaryColor']),
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => SubcategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'orderBy': instance.orderBy,
      'primaryColor': _$JsonConverterToJson<dynamic, Color>(
          instance.primaryColor, const ColorSerializer().toJson),
      'secondaryColor': _$JsonConverterToJson<dynamic, Color>(
          instance.secondaryColor, const ColorSerializer().toJson),
      'subCategories': instance.subCategories,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
