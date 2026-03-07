import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/utils/app_colors.dart';

class AppStyle {
  static TextStyle bold16White = GoogleFonts.hind(
    fontSize: 16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold24Black = GoogleFonts.elMessiri(
    fontSize: 24,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold14Black = GoogleFonts.elMessiri(
    fontSize: 14,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
}
