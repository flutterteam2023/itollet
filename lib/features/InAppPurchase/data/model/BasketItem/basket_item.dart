import 'package:freezed_annotation/freezed_annotation.dart';
part 'basket_item.freezed.dart';
part 'basket_item.g.dart';
@freezed
class BasketItem with _$BasketItem {
  const factory BasketItem({
    required String id,
    required String price,
    required String name,
    required String category1,
    required String category2,
    required String itemType,
  }) = _BasketItem;

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);
}