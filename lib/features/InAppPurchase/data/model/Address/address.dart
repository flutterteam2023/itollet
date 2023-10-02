
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';
@freezed
class Address with _$Address {
  const factory Address({
    required String address,
    required String zipCode,
    required String contactName,
    required String city,
    required String country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}