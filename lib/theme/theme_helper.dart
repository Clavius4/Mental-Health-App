import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.deepPurple50,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appTheme.red10002,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.primary,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: appTheme.gray600,
          fontSize: 14.fSize,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray50,
          fontSize: 12.fSize,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.red200,
          fontSize: 64.fSize,
          fontFamily: 'Nico Moji',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.red200,
          fontSize: 50.fSize,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 26.fSize,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray60001,
          fontSize: 12.fSize,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 10.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 16.fSize,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
    displaySmall: TextStyle(
      color: appTheme.black900,
      fontSize: 36.fSize,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 30.fSize,
      fontFamily: 'Work Sans',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: appTheme.black900,
      fontSize: 24.fSize,
      fontFamily: 'Work Sans',
      fontWeight: FontWeight.w500,
    ),
      );

}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Color(0XFF343A48),
    primaryContainer: Color(0XFFA7CCD4),
    errorContainer: Color(0XFFA534FE),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF371B34),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);
  // Blue
  Color get blue50 => Color(0XFFECFAFF);
  Color get lightBlue => Color(0xFF9AC6CF);

// BlueGray
  Color get blueGray100 => Color(0XFFD9D8D8);
  Color get blueGray10001 => Color(0XFFD5CCC6);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray10002 => Color(0XFFD9D8D8);
  Color get blueGray10003 => Color(0XFFD6D6D6);
  Color get blueGray200 => Color(0XFF9AC6CF);
  Color get blueGray20001 => Color(0XFF99C5CF);
  Color get blueGray40001 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF282840);
  Color get blueGray90001 => Color(0XFF371B34);
// DeepOrange
  Color get deepOrange100 => Color(0XFFE4C5B4);
// DeepPurple
  Color get deepPurple200 => Color(0XFFBEACD5);
  Color get deepPurple50 => Color(0XFFF2E8FF);
  Color get deepPurpleA100 => Color(0XFFA686FF);
  Color get deepPurple900 => Color(0XFF0600B3);
// Gray
  Color get gray100 => Color(0XFFF8F6F6);
  Color get gray10001 => Color(0XFFF4F4F4);
  Color get gray10002 => Color(0XFFF4F3F1);
  Color get gray400 => Color(0XFFBDC3C7);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray600 => Color(0XFF6F6F6F);
  Color get gray60001 => Color(0XFF828282);
  Color get gray800 => Color(0XFF573926);
  Color get gray900 => Color(0XFF372020);
  Color get gray90001 => Color(0XFF241F20);
  Color get gray200 => Color(0XFFE8E8E8);
  Color get gray500 => Color(0XFFABABAB);
  Color get gray50001 => Color(0XFF919191);
  Color get gray50002 => Color(0XFF999999);
  Color get gray700 => Color(0XFF555555);
// Indigo
  Color get indigo50 => Color(0XFFE6E8FD);
// LightGreen
  Color get lightGreen100 => Color(0XFFDEFEBF);
  Color get lightGreen300 => Color(0XFFAEDD81);
// Red
  Color get red100 => Color(0XFFFEDFCE);
  Color get red10001 => Color(0XFFFECECE);
  Color get red10002 => Color(0XFFFFCFCF);
  Color get red200 => Color(0XFFEEA5A5);
  Color get red50 => Color(0XFFFFEBEB);
  // Purple
  Color get purple100 => Color(0XFFFFB0FE);
// Red
  Color get red400 => Color(0XFFEC5865);
// Teal
  Color get teal100 => Color(0XFFB9DEE6);
  Color get teal200 => Color(0XFF94BBC3);
  Color get teal50 => Color(0XFFE1F2F6);
  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}
