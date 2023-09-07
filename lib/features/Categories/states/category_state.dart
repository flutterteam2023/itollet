import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState({
    required List<CategoryModel> categories,
  }) = _CategoryState;
  factory CategoryState.initial() => CategoryState(categories: []);
}
