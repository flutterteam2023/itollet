import 'package:intl/intl.dart' show NumberFormat;

///12.50 => 12.5
///12.00 => 12
///120 => 120
///12.535656 => 12.53
///

String formatQuantity(double? v) {
  if (v == null) return '';
  final formatter = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;
  return formatter.format(v);
}
