import 'package:flutter/services.dart';

/// Форматирование чисел при вводе
class DecimalFormatter extends TextInputFormatter {
  final bool signed;
  final int? decimalDigits;
  late RegExp _regPattern;

  DecimalFormatter({this.decimalDigits, this.signed = false}) {
    _regPattern = RegExp(getPattern());
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final matches = _regPattern.allMatches(newValue.text);
    for (final match in matches) {
      if (match.start == 0 && match.end == newValue.text.length) {
        return newValue;
      }
    }

    return oldValue;
  }

  /// default pattern - '^(\-)?([0-9]+([.]([0-9]+)?)?)?'
  String getPattern() {
    final signedString = signed ? '' : '([-])?';
    final decimalDigitsString =
        decimalDigits == null ? '+' : '{0,$decimalDigits}';
    final decimalPart =
        decimalDigits == 0 ? '' : '[.]([0-9]$decimalDigitsString)?';

    return '$signedString([0-9]+($decimalPart)?)?';
  }
}

/// Форматирование строк при вводе
class StringFormatter extends TextInputFormatter {
  /// Дополнительные символы
  /// ```
  /// StringFormatter(aditionalSymbols: '~@#\n');
  /// ```
  String aditionalSymbols;
  late RegExp _regPattern;

  StringFormatter({this.aditionalSymbols = ''}) {
    _regPattern = RegExp(getPattern());
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final matches = _regPattern.allMatches(newValue.text);
    for (final match in matches) {
      if (match.start == 0 && match.end == newValue.text.length) {
        return newValue;
      }
    }

    return oldValue;
  }

  /// default pattern - '^[0-9a-zA-Zа-яА-Я. -"\'&]+'
  String getPattern() {
    return '^[0-9a-zA-Zа-яА-Я. -"\'&$aditionalSymbols]*';
  }
}
