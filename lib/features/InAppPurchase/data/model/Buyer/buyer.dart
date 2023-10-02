import 'package:freezed_annotation/freezed_annotation.dart';

part 'buyer.freezed.dart';
part 'buyer.g.dart';
@freezed
class Buyer with _$Buyer {
  const factory Buyer({
    required String id,
    required String name,
    required String surname,
    required String identityNumber,
    required String email,
    required String gsmNumber,
    required String registrationDate,
    required String lastLoginDate,
    required String registrationAddress,
    required String city,
    required String country,
    required String zipCode,
    required String ip,
  }) = _Buyer;

  factory Buyer.fromJson(Map<String, dynamic> json) => _$BuyerFromJson(json);
}