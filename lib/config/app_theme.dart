import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AppTheme {

  static const colorLightScheme = ColorScheme(
    primary: Color(0xff5428F1),
    onPrimary: Color(0xff5428F1),
    secondary: Colors.black,
    onSecondary: Colors.black,
    background: Colors.white,
    surface: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.light,
    error: Color(0xffDE172E),
    onError: Color(0xffDE172E),
    onBackground: Color(0xffA9A5A6)
  );

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      colorScheme: colorLightScheme,
      textTheme: const TextTheme().copyWith(

      )
    );
  }
}