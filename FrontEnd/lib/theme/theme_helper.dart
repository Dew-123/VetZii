import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
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

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.onPrimaryContainer;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 26,
        space: 26,
        color: colorScheme.errorContainer,
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
        bodyLarge: TextStyle(
          color: appTheme.gray60002,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90002,
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black90002,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.black90002,
          fontSize: 48.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: appTheme.black90002,
          fontSize: 35.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black90002.withOpacity(0.46),
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: appTheme.lightGreen700,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.blueGray400,
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black90002,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.black90002,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray600,
          fontSize: 15.fSize,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFA8CE50),
    primaryContainer: Color(0XFFFF0000),

    // Error colors
    errorContainer: Color(0XFF7974E7),
    onError: Color(0XFFFFC107),
    onErrorContainer: Color(0XFF110C26),

    // On colors(text colors)
    onPrimary: Color(0XFF1511E5),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber300 => Color(0XFFF7CA57);

  // Black
  Color get black900 => Color(0XFF060518);
  Color get black90001 => Color(0XFF080808);
  Color get black90002 => Color(0XFF000000);

  // Blue
  Color get blue50 => Color(0XFFEBF5FC);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray200 => Color(0XFFADAFBB);
  Color get blueGray400 => Color(0XFF868889);
  Color get blueGray50 => Color(0XFFF1F1F1);
  Color get blueGray60011 => Color(0X1152588F);
  Color get blueGray700 => Color(0XFF4B5563);
  Color get blueGray900 => Color(0XFF1C2A3A);
  Color get blueGray90014 => Color(0X142D2D42);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFFFE7E7);

  // Gray
  Color get gray100 => Color(0XFFF3F4F6);
  Color get gray10001 => Color(0XFFF5F4F4);
  Color get gray200 => Color(0XFFECECEC);
  Color get gray20001 => Color(0XFFE5E7EB);
  Color get gray300 => Color(0XFFE5E5E5);
  Color get gray50 => Color(0XFFF9FAFB);
  Color get gray500 => Color(0XFF959595);
  Color get gray600 => Color(0XFF808080);
  Color get gray60001 => Color(0XFF747688);
  Color get gray60002 => Color(0XFF6B7280);
  Color get gray60066 => Color(0X66848181);
  Color get gray800 => Color(0XFF4D4D4D);

  // Indigo
  Color get indigoA200 => Color(0XFF5470FF);
  Color get indigoA700 => Color(0XFF2C41F8);

  // LightGreen
  Color get lightGreen200 => Color(0XFFD8E8B0);
  Color get lightGreen20001 => Color(0XFFD0E4A0);
  Color get lightGreen50 => Color(0XFFEFF6DF);
  Color get lightGreen500 => Color(0XFFA2C841);
  Color get lightGreen700 => Color(0XFF7E9D2F);
  Color get lightGreenA700 => Color(0XFF6CC51D);

  // Lime
  Color get lime300 => Color(0XFFC2E272);
  Color get lime30001 => Color(0XFFC3E373);

  // Orange
  Color get orange200 => Color(0XFFFFCD6B);

  // Pink
  Color get pink900 => Color(0XFF771D1D);

  // Red
  Color get red300 => Color(0XFFEC6F5A);
  Color get red500A2 => Color(0XA2F14336);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
