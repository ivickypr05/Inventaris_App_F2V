import 'package:intl/intl.dart';

class FormNUM {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp.',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}