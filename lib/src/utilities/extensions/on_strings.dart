import 'package:intl/intl.dart';

extension StringsEctension on String? {
  bool isValidEmail() {
    if (this == null) return false;
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this!);
  }

  String? capitalize() {
    if (isNullOrEmpty()) return '';
    return '${this![0].toLowerCase()}${this!.substring(1)}';
  }

  String? capitalizeFirstLetterOfEachWord() {
    if (this == null) return this;
    List<String> words = this!.split(' ');
    List<String> capitalizedWords = <String>[];

    for (String word in words) {
      if (word.isNotEmpty) {
        String capitalizedWord = word[0].toUpperCase() + word.substring(1);
        capitalizedWords.add(capitalizedWord);
      } else {
        capitalizedWords.add(word);
      }
    }
    return capitalizedWords.join(' ');
  }

  String? formatAmountAndAddCurrencySymbol() {
    if (this == null || this!.isEmpty) return this;
    this!.trim();
    final NumberFormat format = NumberFormat.currency(
        locale: 'en_IN',
        // symbol: AppInfoService.instance.currencySymbol,
        decimalDigits: 0,
        customPattern: '\u00A4 #,##0.00');
    return format.format(double.tryParse(this!));
  }

  String? removeSpecialCharacters() {
    if (this == null) return this;
    RegExp specialCharRegExp = RegExp(r'[^\w\s]', multiLine: true);
    return this!.replaceAll(specialCharRegExp, '');
  }

  bool isNullOrEmpty() {
    if (this == null) return true;
    return this!.isEmpty;
  }

  bool isNotNullNorEmpty() {
    if (this == null) return false;
    return this!.isNotEmpty;
  }
}
