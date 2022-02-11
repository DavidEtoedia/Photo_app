import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = Provider<AppThemeData>((ref) {
  return AppThemeData();
});

class AppThemeData {
  final appTheme = ThemeData(
      appBarTheme: AppBarTheme(
          color: Colors.grey,
          titleTextStyle: TextStyle(
              fontSize: 26, fontFamily: GoogleFonts.openSans().fontFamily)),
      primaryColor: Colors.blue,
      fontFamily: GoogleFonts.openSans().fontFamily,
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 55, color: Colors.white, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              height: 1.5)));
}
