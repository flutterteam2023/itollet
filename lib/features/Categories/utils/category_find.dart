import 'package:itollet/features/Categories/models/category/category_model.dart';

String? subcategoryNameFindWithSubcategoryID(String subCategoryId, List<CategoryModel> categories) {
  for (var mainCategory in categories) {
    for (var subCategoryLevel1 in mainCategory.subCategories) {
      if (subCategoryLevel1.id == subCategoryId) {
        return subCategoryLevel1.name;
      }
    }
  }
  return null;
}

String? mainCategoryNameFindWithSubCategoryID(String subCategoryID, List<CategoryModel> categories) {
  for (var mainCategory in categories) {
    for (var subCategoryLevel1 in mainCategory.subCategories) {
      if (subCategoryLevel1.id == subCategoryID) {
        return mainCategory.name;
      }
    }
  }
  return null;
}
