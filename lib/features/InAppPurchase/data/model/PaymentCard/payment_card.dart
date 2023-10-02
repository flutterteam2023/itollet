import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_card.freezed.dart';
part 'payment_card.g.dart';
@freezed
class PaymentCard with _$PaymentCard {
  const factory PaymentCard({
    required String cardHolderName,
    required String cardNumber,
    required String expireYear,
    required String expireMonth,
    required String cvc,
  }) = _PaymentCard;

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);
}
