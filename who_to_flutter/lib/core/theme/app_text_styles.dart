import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get base => GoogleFonts.outfit(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get heroTitle => base.copyWith(
        fontSize: 30, // clamp(1.5rem, 5vw, 1.875rem)
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.9, // -0.03em
      );

  static TextStyle get heroSubtitle => base.copyWith(
        fontSize: 16,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get sectionTitle => base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get cardTitle => base.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bodyText => base.copyWith(
        fontSize: 14,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get secondaryText => base.copyWith(
        fontSize: 13,
        color: AppColors.textSecondary,
      );

  static TextStyle get hintText => base.copyWith(
        fontSize: 12,
        color: AppColors.textSecondary,
      );

  static TextStyle get btnText => base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}
