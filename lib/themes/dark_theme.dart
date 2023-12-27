import 'package:flutter/material.dart';
import 'package:pharmacy_app/utility/constants.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff272829),
  ),
  textTheme: const TextTheme(
      headlineSmall: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white)),
  popupMenuTheme: PopupMenuThemeData(color: appBackColorDark),
  bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff272829)),
  cardTheme: CardTheme(
    color: appBackColorDark,
  ),
  listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
          color: Colors.red, fontSize: 24, overflow: TextOverflow.ellipsis),
      subtitleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      )),
  colorScheme: ColorScheme.dark(
      background: const Color(0xff272829),
      primary: const Color(0xff272829),
      secondary: Colors.grey[800]!,
      onSecondaryContainer: Colors.red),
);
