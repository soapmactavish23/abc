import 'package:flutter/material.dart';
import 'package:radar_peconhento_mobile/main_package/theme/constants.dart';

sealed class MainTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  static ThemeData themeData = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsConstants.defaultColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      centerTitle: true,
      backgroundColor: ColorsConstants.secondaryColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ColorsConstants.defaultColor, width: 1),
        foregroundColor: ColorsConstants.defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.grey),
      floatingLabelStyle: const TextStyle(color: ColorsConstants.defaultColor),
      border: _defaultInputBorder,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorsConstants.danger),
      ),
      suffixIconColor: Colors.grey,
      focusedBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorsConstants.defaultColor),
      ),
    ),
  );
}
