import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  final Color primary;
  final Color background;
  final Color surface;
  final Color text;
  final Color textSecondary;
  final Color accent;
  final Color error;

  const AppColors({
    required this.primary,
    required this.background,
    required this.surface,
    required this.text,
    required this.textSecondary,
    required this.accent,
    required this.error,
  });

  // Light Theme Colors
  static final light = AppColors(
    primary: const Color(0xFFAB28B2),
    background: const Color(0xFFFFFFFF),
    surface: Colors.white,
    text: Colors.black,
    textSecondary: Color(0xFF979797),
    accent: const Color(0xFF03DAC6),
    error: Colors.red,
  );

  // Dark Theme Colors
  static final dark = AppColors(
    primary: const Color(0xFFAB28B2),
    background: const Color(0xFF1E1E1E),
    surface: const Color(0xFF1E1E1E),
    text: Colors.white,
    textSecondary: Color(0xFF979797),
    accent: const Color(0xFF03DAC6),
    error: Colors.red,
  );
}

class AppTypography {
  final TextStyle headline;
  final TextStyle body;
  final TextStyle caption;

  const AppTypography({
    required this.headline,
    required this.body,
    required this.caption,
  });

  factory AppTypography.fromColors(AppColors colors) {
    return AppTypography(
      headline: GoogleFonts.inter(
        color: colors.text,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      body: GoogleFonts.inter(color: colors.text, fontSize: 16),
      caption: GoogleFonts.inter(color: colors.textSecondary, fontSize: 12),
    );
  }
}

class AppTheme {
  final AppColors colors;
  final AppTypography typography;

  const AppTheme({required this.colors, required this.typography});

  factory AppTheme.light() => AppTheme(
    colors: AppColors.light,
    typography: AppTypography.fromColors(AppColors.light),
  );

  factory AppTheme.dark() => AppTheme(
    colors: AppColors.dark,
    typography: AppTypography.fromColors(AppColors.dark),
  );
}
