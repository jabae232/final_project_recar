
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static final s24w700 = GoogleFonts.poppins(
    textStyle: const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlack,
    )
  );
  static final s16w400= GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.mainBlack,
    )
  );
  static final w400poppins= GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.mainBlack,
      )
  );
  static final s14w400 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textMainWhite,
    ),
  );
  static final s18w700 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: AppColors.mainWhite,
    )
  );
  static final s14w500 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    )
  );
  static final s12w300 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
    )
  );
  static final s13w400 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    )
  );
  static final s21w500 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
    )
  );
  static final s18w500roboto= GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: AppColors.mainBlack,
      )
  );
}
