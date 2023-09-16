import 'package:itollet/features/Categories/models/category/category_model.dart';

///subcategoryNameFindWithSubcategoryID("21b15084-01a9-4e76-ba04-dbd85258c286",categories.categories,)
///Output: ROBOT SÜPÜRGE

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

///mainCategoryNameFindWithSubCategoryID("21b15084-01a9-4e76-ba04-dbd85258c286",categories.categories,)
///Output: TAMİRAT
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
