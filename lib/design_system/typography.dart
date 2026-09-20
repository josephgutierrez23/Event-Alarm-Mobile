import 'package:flutter/material.dart';

import 'colors.dart';

class AppTypography {
  AppTypography._();

  static const String archivo = 'Archivo';
  static const String manrope = 'Manrope';

  static const TextStyle h1 = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w800,
    fontSize: 32,
    height: 38 / 32,
    letterSpacing: -0.32,
    color: AppColors.niebla050,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 30 / 24,
    letterSpacing: -0.12,
    color: AppColors.niebla050,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 26 / 20,
    color: AppColors.niebla050,
  );

  static const TextStyle highlighted = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 24 / 17,
    color: AppColors.niebla050,
  );

  static const TextStyle body = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 22 / 15,
    color: AppColors.niebla200,
  );

  static const TextStyle label = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: 18 / 13,
    letterSpacing: 0.13,
    color: AppColors.niebla200,
  );

  static const TextStyle meta = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.11,
    color: AppColors.niebla400,
  );

  static const TextStyle metaSecondary = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0.11,
    color: AppColors.niebla200,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w600,
    fontSize: 10,
    height: 14 / 10,
    letterSpacing: 0.8,
    color: AppColors.niebla400,
  );

  static const TextStyle clockXl = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w800,
    fontSize: 96,
    height: 1,
    letterSpacing: -1.92,
    color: AppColors.niebla050,
  );

  static const TextStyle clockL = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w800,
    fontSize: 72,
    height: 78 / 72,
    letterSpacing: -1.44,
    color: AppColors.niebla050,
  );

  static const TextStyle clockM = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w700,
    fontSize: 40,
    height: 48 / 40,
    letterSpacing: -0.4,
    color: AppColors.niebla050,
  );

  static const TextStyle clockS = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w600,
    fontSize: 34,
    height: 40 / 34,
    letterSpacing: -0.34,
    color: AppColors.niebla050,
  );

  static const TextStyle splashTitle = TextStyle(
    fontFamily: archivo,
    fontWeight: FontWeight.w800,
    fontSize: 28,
    height: 34 / 28,
    color: AppColors.niebla050,
  );

  static const TextStyle splashSubtitle = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 20 / 13,
    color: AppColors.niebla200,
  );

  static const TextStyle button = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.14,
    color: AppColors.noche950,
  );

  static const TextStyle fieldLabel = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.niebla200,
  );

  static const TextStyle fieldValue = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 22 / 15,
    color: AppColors.niebla050,
  );

  static const TextStyle fieldHint = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 22 / 15,
    color: AppColors.niebla400,
  );

  static const TextStyle legal = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 14 / 10,
    color: AppColors.niebla400,
  );

  static const TextStyle statusTime = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 16 / 11,
    color: AppColors.niebla200,
  );

  static const TextStyle eventOptionTitle = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    color: AppColors.niebla050,
  );

  static const TextStyle eventOptionSubtitle = TextStyle(
    fontFamily: manrope,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    color: AppColors.niebla200,
  );
}
