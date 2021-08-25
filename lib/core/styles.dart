import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const primary = Color(0xffff9320);

  static const primaryVariant = Color(0xffc41b32);

  static const secondary = Color(0xFFf98314);
  static const secondaryVariant = Color(0xffd97212);
  static const surface = primary;
  static const error = Colors.redAccent;
  static const onPrimary = Colors.white;
  static const onSecondary = Colors.white;
  static const onSurface = Colors.white;
  static const onError = Colors.white;

  //Depending on theming
  static const brightnessLight = Brightness.light;
  static const brightnessDark = Brightness.dark;

  static const backgroundLight = Color(0xFFF8F4F2);
  static const onBackgroundLight = backgroundDark;

  static const backgroundDark = Color(0xFF1A1313);
  static const onBackgroundDark = Colors.white;

  static const fontFamily = GoogleFonts.inter;
  static const textTheme = GoogleFonts.interTextTheme;

  static TextTheme buildTextTheme(BuildContext context, Color onBackground) {
    return textTheme(
      TextTheme(
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: onBackground,
        ),
        headline5: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: primary,
        ),
        headline4: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: onBackground,
        ),
        headline3: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: onBackground,
        ),
        button: TextStyle(
          color: onPrimary,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData buildLight(BuildContext context) {
    final textTheme = buildTextTheme(context, onBackgroundLight);

    return ThemeData.from(
      colorScheme: const ColorScheme(
        brightness: brightnessLight,
        primary: primary,
        primaryVariant: primaryVariant,
        secondary: secondary,
        secondaryVariant: secondaryVariant,
        surface: surface,
        background: backgroundLight,
        error: error,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onSurface: onSurface,
        onBackground: onBackgroundLight,
        onError: onError,
      ),
      textTheme: textTheme,
    ).copyWith(
      appBarTheme: appBarTheme(context, backgroundLight, onBackgroundLight),
      applyElevationOverlayColor: false,
    );
  }

  static ThemeData buildDark(BuildContext context) {
    final textTheme = buildTextTheme(context, onBackgroundDark);

    return ThemeData.from(
      colorScheme: const ColorScheme(
        brightness: brightnessDark,
        primary: primary,
        primaryVariant: primaryVariant,
        secondary: secondary,
        secondaryVariant: secondaryVariant,
        surface: surface,
        background: backgroundDark,
        error: error,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onSurface: onSurface,
        onBackground: onBackgroundDark,
        onError: onError,
      ),
      textTheme: textTheme,
    ).copyWith(
      appBarTheme: appBarTheme(context, backgroundDark, onBackgroundDark),
      applyElevationOverlayColor: false,
    );
  }

  static AppBarTheme appBarTheme(
    BuildContext context,
    Color background,
    Color onBackground,
  ) {
    return AppBarTheme(
      backwardsCompatibility: false,
      elevation: 1.0,
      backgroundColor: background,
      foregroundColor: secondary,
      titleTextStyle: fontFamily(
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: primary,
        ),
      ),
    );
  }
}
