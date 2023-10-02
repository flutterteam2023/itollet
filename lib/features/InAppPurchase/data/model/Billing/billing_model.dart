import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/InAppPurchase/data/model/Address/address.dart';
import 'package:itollet/features/InAppPurchase/data/model/BasketItem/basket_item.dart';
import 'package:itollet/features/InAppPurchase/data/model/Buyer/buyer.dart';
import 'package:itollet/features/InAppPurchase/data/model/PaymentCard/payment_card.dart';

part 'billing_model.freezed.dart';
part 'billing_model.g.dart';
@freezed
class BillingModel with _$BillingModel {
  const factory BillingModel({
    required String locale,
    required String conversationId,
    required String price,
    required String paidPrice,
    required int installment,
    required String paymentChannel,
    required String basketId,
    required String paymentGroup,
    required PaymentCard paymentCard,
    required Buyer buyer,
    required Address shippingAddress,
    required Address billingAddress,
    required List<BasketItem> basketItems,
    required String currency,
    required String callbackUrl,
  }) = _BillingModel;

  factory BillingModel.fromJson(Map<String, dynamic> json) =>
      _$BillingModelFromJson(json);
}