import 'package:flutter/material.dart';

import '_ui_kit.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black45),
      centerTitle: true,
      titleTextStyle: AppTextStyle.h2Style,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.h1Style,
      displayMedium: AppTextStyle.h2Style,
      displaySmall: AppTextStyle.h3Style,
      headlineMedium: AppTextStyle.h4StyleLight,
      headlineSmall: AppTextStyle.h5StyleLight,
      bodyLarge: AppTextStyle.bodyTextLight,
      titleMedium: AppTextStyle.subtitleLight,
    ),
    hintColor: Colors.black45,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      filled: true,
      contentPadding: EdgeInsets.all(20),
      fillColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColor.accent,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColor.accent,
    ),
    iconTheme: const IconThemeData(color: Colors.black45),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: const TextStyle(color: Colors.white),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyle.h2Style,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.h1Style.copyWith(color: Colors.white),
      displayMedium: AppTextStyle.h2Style.copyWith(color: Colors.white),
      displaySmall: AppTextStyle.h3Style.copyWith(color: Colors.white),
      headlineMedium: AppTextStyle.h4StyleLight.copyWith(color: Colors.white),
      headlineSmall: AppTextStyle.h5StyleLight.copyWith(color: Colors.white),
      bodyLarge: AppTextStyle.bodyTextLight.copyWith(color: Colors.white),
      titleMedium: AppTextStyle.subtitleLight.copyWith(color: Colors.white60),
    ),
    hintColor: Colors.white60,
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      filled: true,
      contentPadding: EdgeInsets.all(20),
      fillColor: AppColor.dark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColor.accent,
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.dark,
      selectedItemColor: AppColor.accent,
      unselectedItemColor: Colors.white70,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColor.dark,
    ),
  );
}
