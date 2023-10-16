import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Account/Utils/account_transaction_type_enum.dart';

class AccountTransactionTypeSerializer
    implements JsonConverter<AccountTransactionTypes, dynamic> {
  const AccountTransactionTypeSerializer();
  @override
  AccountTransactionTypes fromJson(dynamic typeString) {
    if (typeString == AccountTransactionTypes.addBalance.name) {
      return AccountTransactionTypes.addBalance;
    } else if (typeString == AccountTransactionTypes.biddingFee.name) {
      return AccountTransactionTypes.biddingFee;
    } else if (typeString == AccountTransactionTypes.extensionFee.name) {
      return AccountTransactionTypes.extensionFee;
    } else {
      return AccountTransactionTypes.addBalance;
    }
  }

  @override
  String toJson(AccountTransactionTypes typeModel) {
    switch (typeModel) {
      case AccountTransactionTypes.addBalance:
        return AccountTransactionTypes.addBalance.name;
      case AccountTransactionTypes.biddingFee:
        return AccountTransactionTypes.biddingFee.name;
      case AccountTransactionTypes.extensionFee:
        return AccountTransactionTypes.extensionFee.name;
      default:
        return "";
    }
  }
}
