// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_card_model.freezed.dart';
part 'payment_card_model.g.dart';

@freezed
class PaymentCardModel with _$PaymentCardModel {
  const factory PaymentCardModel({
    ///Sample: John Doe
    ///Ödemenin alınacağı kart sahibinin adı soyadı. Eğer saklı kart ile ödeme yapılmıyorsa zorunludur.
    @JsonKey(name: "cardHolderName") required String cardHolderName,

    ///Sample: 5528790000000008
    ///Ödemenin alınacağı kart numarası. Eğer saklı kart ile ödeme yapılmıyorsa zorunludur.
    @JsonKey(name: "cardNumber") required String cardNumber,

    ///Sample: 12
    ///Ödemenin alınacağı kartın son kullanma tarihi ayı. Eğer saklı kart ile ödeme yapılmıyorsa zorunludur.
    @JsonKey(name: "expireMonth") required String expireMonth,

    ///Sample: 2030
    ///Ödemenin alınacağı kartın son kullanma tarihi yılı. Eğer saklı kart ile ödeme yapılmıyorsa zorunludur.
    @JsonKey(name: "expireYear") required String expireYear,

    ///Sample: 123
    ///Ödemenin alınacağı kartın güvenlik kodu. Eğer saklı kart ile ödeme yapılmıyorsa zorunludur. Saklı kartla ödeme yapılırken gönderilirse aynen bankaya iletilir.
    @JsonKey(name: "cvc") required String cvc,

    ///Sample: 0
    ///Ödeme esnasında kartın kaydedilip kaydedilmeyeceğini belirleyen parametre. Varsayılan değeri 0 olup, geçerli değerler 0 ve 1’dir.
    @JsonKey(name: "registerCard") required String registerCard,
  }) = _PaymentCardModel;

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardModelFromJson(json);
}
