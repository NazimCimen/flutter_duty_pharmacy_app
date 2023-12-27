import 'package:flutter/material.dart';
import 'package:pharmacy_app/utility/constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffFFF3E2),
      ),
  textTheme: const TextTheme(
      headlineSmall: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black)),
  popupMenuTheme: PopupMenuThemeData(color:appBackgColorLight ),
  bottomAppBarTheme: BottomAppBarTheme(color: appBackgColorLight),
  cardTheme: CardTheme(color: appBackgColorLight),
  listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(color: Colors.red,  fontSize: 20,
          overflow: TextOverflow.ellipsis),
      subtitleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          overflow: TextOverflow.ellipsis)),
  colorScheme: ColorScheme.light(
      background: appBackgColorLight,
      primary: const Color(0xff272829),
      secondary: Colors.grey[800]!,
      onSecondaryContainer: Colors.red),
);
