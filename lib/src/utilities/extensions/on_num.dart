import 'package:intl/intl.dart';

extension NumExtension on num? {
  String formatAmountAndAddCurrencySymbol(
    String currencyCode,
  ) {
    if (this == null) return '';

    double rate = 1.0;
    // String symbol;

    if (currencyCode == 'USD') {
      // Fetch live currency rate for USD conversion
      // finalPrice = await LiveCurrencyRate.convertCurrency(
      //     'INR', 'USD', this!.toDouble());
      rate = 0.0119759;
      // symbol = '\$'; // USD symbol
    } else {
      // symbol = AppInfoService.instance.currencySymbol; // Default symbol for INR
    }

    final NumberFormat format = NumberFormat.currency(
      locale: 'en_US',
      // symbol: symbol,
      decimalDigits: 2,
      customPattern: '\u00A4 #,##0.00',
    );

    return format.format((this! * rate));
  }
}
