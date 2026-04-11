import 'package:flutter/material.dart';

class AppColors {
  static const Color bgPage = Color(0xFFFAFAFA);
  static const Color bgSecondary = Color(0xFFF4F4F5);
  static const Color bgCard = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF18181B);
  static const Color textSecondary = Color(0xFF71717A);
  static const Color border = Color(0xFFE4E4E7);
  static const Color accent = Color(0xFF90C5FC);
  static const Color accentHover = Color(0xFF7BB5F8);

  // Gradient Colors
  static const Color gradientStart = Color(0xFFDFC3FC);
  static const Color gradientEnd = Color(0xFF90C5FC);

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );

  static LinearGradient accentGradientSoft = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      gradientStart.withValues(alpha: 0.15),
      gradientEnd.withValues(alpha: 0.15),
    ],
  );
}
