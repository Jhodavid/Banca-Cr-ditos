import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CurrencyInputFormatter extends TextInputFormatter {

  static final NumberFormat currencyFormat = NumberFormat.currency(locale: "en_CO", decimalDigits: 2, symbol: "\$");

  static String format(String value) {
    try {
      final number = double.parse(value);
      return currencyFormat.format(number);
    } catch (e) {
      return value;
    }
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      double value = double.parse(newValue.text.replaceAll(RegExp('[^0-9]'), ''));
      final newText = currencyFormat.format(value / 100);
      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }
    return newValue;
  }
}