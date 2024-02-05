
import 'package:banca_creditos/main.dart';
import 'package:flutter/material.dart';

class SnackBarMessages {

  static void showSnackBar(String message, String closeMessage) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(5),
        content: Text(message),
        action: SnackBarAction(
          label: closeMessage,
          onPressed: () {},
        ),
      )
    );
  }

}