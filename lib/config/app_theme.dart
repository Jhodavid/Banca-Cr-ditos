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
        displayMedium: const TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
        labelLarge: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),
        labelMedium: const TextStyle(
          fontSize: 16
        ),
        labelSmall: const TextStyle(
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
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xffd22a3d),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding: const EdgeInsets.all(5),
        behavior: SnackBarBehavior.floating,
        actionBackgroundColor: Colors.white,
        actionTextColor: const Color(0xffd22a3d),
        contentTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          // fontWeight: FontWeight.bold
        )
      )
    );
  }
}