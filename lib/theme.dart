import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 0,46,88),
  fontFamily: GoogleFonts.josefinSans().fontFamily,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.w700,color: Colors.black),
    bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    // subtitle1: TextStyle(fontSize: 40, height: 2),
  ),

  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromARGB(255, 143, 182, 237)),
  // textTheme: TextTheme(
  // bodyLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,fontFamily: GoogleFonts.josefinSans().fontFamily),
  // button: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontFamily: GoogleFonts.josefinSans().fontFamily),
  // bodyText1: TextStyle(fontSize: 25,fontFamily: GoogleFonts.josefinSans().fontFamily),
  // ),

);