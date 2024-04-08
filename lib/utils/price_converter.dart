String priceConverter(dynamic price) {
  price = price.toString().replaceAll(".", "");
  final dPrice = double.tryParse(price.toString());
  if (dPrice != null) {
    if (dPrice < 1000) {
      return "${dPrice.toString()[0]}${dPrice.toString()[1]}${dPrice.toString()[2]}";
    } else if (dPrice >= 1000 && dPrice < 10000) {
      return "${dPrice.toString()[0]}.${dPrice.toString()[1]}${dPrice.toString()[2]}${dPrice.toString()[3]}";
    } else if (dPrice >= 10000 && dPrice < 100000) {
      return "${dPrice.toString()[0]}${dPrice.toString()[1]}.${dPrice.toString()[2]}${dPrice.toString()[3]}${dPrice.toString()[4]}";
    } else if (dPrice >= 100000 && dPrice < 1000000) {
      return "${dPrice.toString()[0]}${dPrice.toString()[1]}${dPrice.toString()[2]}.${dPrice.toString()[3]}${dPrice.toString()[4]}${dPrice.toString()[5]}";
    } else if (dPrice >= 1000000 && dPrice < 10000000) {
      return "${dPrice.toString()[0]}.${dPrice.toString()[1]}${dPrice.toString()[2]}${dPrice.toString()[3]}.${dPrice.toString()[4]}${dPrice.toString()[5]}${dPrice.toString()[6]}";
    } else if (dPrice >= 10000000 && dPrice < 100000000) {
      return "${dPrice.toString()[0]}${dPrice.toString()[1]}.${dPrice.toString()[2]}${dPrice.toString()[3]}${dPrice.toString()[4]}.${dPrice.toString()[5]}${dPrice.toString()[6]}${dPrice.toString()[7]}";
    } else {
      return dPrice.toString();
    }
  } else {
    return price.toString();
  }
}
