import 'package:freezed_annotation/freezed_annotation.dart';

part 'subcategory_model.freezed.dart';
part 'subcategory_model.g.dart';

@freezed
class SubcategoryModel with _$SubcategoryModel {
  factory SubcategoryModel({
    required String name,
    required String iconUrl,
    required String id,
    @Default([]) List<SubcategoryModel> subCategories,
  }) = _SubcategoryModel;

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) => _$SubcategoryModelFromJson(json);
}
