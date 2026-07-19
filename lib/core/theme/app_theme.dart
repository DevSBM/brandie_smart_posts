import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color.fromARGB(255, 152, 221, 189);
  static const darkBackground = Color.fromARGB(255, 8, 11, 14);
  static const overlay = Color.fromARGB(153, 0, 0, 0);
  static const secondaryText = Color.fromARGB(255, 147, 153, 165);

  static const progressTrack = Color(0xFFE9EFEC);
  static const dialogText = Color(0xFFB0B0B0);
}

abstract final class AppSpacing {
  static const small = 8.0;
  static const medium = 12.0;
  static const large = 16.0;
  static const extraLarge = 24.0;
}

abstract final class AppRadius {
  static const small = 8.0;
  static const medium = 14.0;
  static const large = 20.0;
}

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
    );
  }
}
