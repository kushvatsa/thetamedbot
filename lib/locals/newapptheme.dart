import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAppTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor, false, false);

  static ThemeData themeData(
      ColorScheme colorScheme, Color focusColor, bool isDark, bool lightsOut) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme.apply(
        bodyColor: colorScheme.onPrimary,
        displayColor: colorScheme.onPrimary,
      ),
      cursorColor: colorScheme.secondary,
      indicatorColor: colorScheme.secondary,
      inputDecorationTheme: InputDecorationTheme(
        focusColor: colorScheme.primary,
        labelStyle: TextStyle(color: colorScheme.onPrimary),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: colorScheme.secondary,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)),
          textTheme: ButtonTextTheme.primary),
      dividerTheme: DividerThemeData(
        thickness: 1.0,
        color: colorScheme.onPrimary,
      ),
      dialogTheme: DialogTheme(backgroundColor: colorScheme.background),
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.secondary),
      cardTheme: CardTheme(
          color: isDark
              ? lightsOut
                  ? const Color(0xFF121212)
                  : const Color(0xFF37474F)
              : _darkFillColor),
      canvasColor: colorScheme.background,
      unselectedWidgetColor: colorScheme.secondary,
      toggleableActiveColor: colorScheme.secondary,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: colorScheme.primary,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1.apply(color: _darkFillColor),
      ),
    );
  }

  static ColorScheme lightColorScheme = ColorScheme(
    primary: const Color(0xFFFF5722),
    primaryVariant: const Color(0xFFFF5722),
    secondary: const Color(0xFFFF5722),
    secondaryVariant: const Color(0xFFFF5722),
    background: const Color(0xFFE6EBEB),
    surface: const Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: const Color(0xFF322942),
    onSurface: const Color(0xFF121212),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static TextTheme _textTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}
