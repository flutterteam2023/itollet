enum AccountTransactionTypes {
  addBalance,
  biddingFee,
  extensionFee,
}

extension ToTurkishName on AccountTransactionTypes {
  String get toTitle {
    if (this == AccountTransactionTypes.addBalance) {
      return "Bakiye yüklendi";
    } else if (this == AccountTransactionTypes.biddingFee) {
      return "Teklif verme ücreti";
    } else if (this == AccountTransactionTypes.extensionFee) {
      return "Süre uzatma ücreti";
    } else {
      return "null";
    }
  }
}
