import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test3/Maxlook/utils/constants.dart';

class GlobalThemData {
  static ThemeData lightThemeData = _themeData(_lightColorScheme, orangeColor,
      _textTheme, _iconTheme, _iconButtonThemeData);
  // static ThemeData darkThemeData = _themeData(darkColorScheme, _darkFocusColor);

  static ThemeData _themeData(
      ColorScheme colorScheme,
      Color focusColor,
      TextTheme textTheme,
      IconThemeData iconThemeData,
      IconButtonThemeData iconButtonThemeData) {
    return ThemeData(
        fontFamily: 'SF Compact Rounded',
        colorScheme: colorScheme,
        canvasColor: colorScheme.background,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: focusColor,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder()
        }),
        useMaterial3: true,
        iconButtonTheme: iconButtonThemeData,
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(orangeColor),
        )),
        iconTheme: iconThemeData);
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: lightColor,
      onPrimary: darkColor,
      secondary: orangeColor,
      onSecondary: lightGreyColor,
      error: Colors.red,
      onError: lightColor,
      background: lightColor,
      onBackground: darkColor,
      surface: lightGreyColor,
      onSurface: darkColor);
  // static const ColorScheme darkColorScheme = ColorScheme();

  static IconButtonThemeData _iconButtonThemeData = IconButtonThemeData(
      style: ButtonStyle(
    iconColor: MaterialStateColor.resolveWith((states) => darkColor),
    overlayColor:
        MaterialStateColor.resolveWith((states) => orangeGradientColor),
    iconSize: MaterialStateProperty.resolveWith((states) => 28.0),
  ));

  static TextTheme _textTheme = TextTheme(
    headlineLarge: GoogleFonts.lexend(
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: darkColor,
        fontSize: 28.0,
        letterSpacing: -1.0,
      ),
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w600,
      color: darkColor,
      fontSize: 22.0,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: darkColor,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      // color: darkColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: darkColor,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
    displayMedium: TextStyle(
      // color: darkColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: darkColor,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    labelSmall: TextStyle(
      color: darkColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w800,
    ),
  );

  static const IconThemeData _iconTheme =
      IconThemeData(size: 32, color: darkColor);
}
