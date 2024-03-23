import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class MyThemeData {
  BuildContext context;

  MyThemeData(this.context);

  static ThemeData lightThemeData = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.green,
      textTheme: TextTheme(
        labelSmall: GoogleFonts.montserrat(fontSize: 13,fontWeight: FontWeight.normal),
        bodySmall: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.normal),
        bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
        bodyLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        labelMedium: GoogleFonts.exo(fontSize: 14, fontWeight: FontWeight.bold),
        labelLarge: GoogleFonts.exo(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.green,
          iconTheme: IconThemeData(color: Colors.white, size: 30)));

}
