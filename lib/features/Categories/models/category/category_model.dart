import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Categories/models/subcategory/subcategory_model.dart';
import 'package:itollet/features/Categories/utils/color_serializer.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required String? name,
    required String? iconUrl,
    @Default(0) int? orderBy,
    //firebase de renkler argb formatında olmalı örneğin
    //255, 244, 67, 54 şeklinde string olarak gelmeli
    @ColorSerializer() required Color? primaryColor,
    @ColorSerializer() required Color? secondaryColor,
    required List<SubcategoryModel> subCategories,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
