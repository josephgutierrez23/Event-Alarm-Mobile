import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design_system/colors.dart';
import '../design_system/typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppTypography.manrope,
      scaffoldBackgroundColor: AppColors.noche900,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.noche900,
        primary: AppColors.amanecer500,
        onPrimary: AppColors.noche950,
        onSurface: AppColors.niebla050,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.noche900,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
