import 'package:flutter/material.dart';



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
      fontFamily: 'ProductSans',
      colorScheme: colorLightScheme,
      textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
          color: Colors.black,
        ),
        bodyMedium: const TextStyle(
          color: Colors.grey,
          fontSize: 14
        ),
        displaySmall: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
        labelLarge: const TextStyle(
          fontWeight: FontWeight.bold
        ),
        labelMedium: const TextStyle(
          color: Colors.black,
          fontSize: 14
        ),
        titleLarge: const TextStyle(
          color: Colors.black,
          fontSize: 26
        ),
        titleMedium: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
        titleSmall: const TextStyle(
          color: Colors.grey
        )
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
        linearTrackColor: Colors.grey,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          iconColor: const MaterialStatePropertyAll<Color>(Colors.grey),
          fixedSize: const MaterialStatePropertyAll<Size>(
            Size(double.infinity, 45)
          ),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffC8D0D9)),
          borderRadius: BorderRadius.circular(5)
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffC8D0D9)),
          borderRadius: BorderRadius.circular(5)
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffC8D0D9)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStatePropertyAll<Color>(colorLightScheme.primary),
        fillColor: const MaterialStatePropertyAll<Color>(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: Color(0xFFD0D5DD))
      ),
      dataTableTheme: const DataTableThemeData(
        horizontalMargin: 0,
        headingTextStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold
        ),
        dividerThickness: 0.0,
        columnSpacing: 0,
        dataTextStyle: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
        )
      )
    );
  }
}