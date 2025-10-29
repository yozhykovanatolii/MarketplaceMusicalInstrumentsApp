import 'package:flutter/material.dart';

class AppTheme {
  static final _textTheme = TextTheme(
    headlineLarge: const TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 35,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.grey[600],
      fontSize: 15,
    ),
    labelSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: Colors.grey[600],
      fontSize: 17,
    ),
  );

  static final _tabBarTheme = const TabBarThemeData(
    indicatorColor: Color(0xFF007DFC),
    labelColor: Color(0xFF007DFC),
    unselectedLabelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );

  static ThemeData get lightMode {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      tabBarTheme: _tabBarTheme,
      textTheme: _textTheme,
    );
  }

  static ThemeData get darkMode {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),

      tabBarTheme: _tabBarTheme,
      textTheme: _textTheme,
    );
  }
}
