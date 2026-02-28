import 'package:flutter/material.dart';
import 'package:gym_app/style/typography/app_text_style.dart';
import 'package:gym_app/style/colors/app_colors.dart';

class AppTheme {
  // ================= LIGHT =================
  static ThemeData get light {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,

      // Colors
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
      ),

      // Typography
      textTheme: _textTheme,

      // Components
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      cardTheme: _cardTheme,
    );
  }

  // ================= DARK =================
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.black,

      textTheme: _textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),

      appBarTheme: _appBarTheme,
    );
  }

  // ================= PRIVATE PARTS =================

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      titleLarge: AppTextStyles.titleLarge,
      bodyMedium: AppTextStyles.bodyLargeMedium,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyles.titleLarge,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  static CardThemeData get _cardTheme {
    return CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
