import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Categories/utils/color_serializer.dart';

part 'subcategory_model.freezed.dart';
part 'subcategory_model.g.dart';

@freezed
class SubcategoryModel with _$SubcategoryModel {
  factory SubcategoryModel({
    required String? name,
    required String? iconUrl,
    @ColorSerializer() required Color? color1,
    @ColorSerializer() required Color? color2,
  }) = _SubcategoryModel;

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => _$SubcategoryModelFromJson(json);
}
