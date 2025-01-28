import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String apiKey = 'f302292fbb6c5976038c6c1191526de8';

// Colors
const Color primaryColor1 = Color.fromARGB(255, 112, 131, 255);
const Color primaryColor2 = Color.fromARGB(255, 255, 112, 248);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;

const h10 = SizedBox(height: 10);
const h20 = SizedBox(width: 20);
const h30 = SizedBox(height: 30);

// BorderRadius
BorderRadius radius10 = BorderRadius.circular(10);
BorderRadius radius12 = BorderRadius.circular(12);
BorderRadius radius20 = BorderRadius.circular(20);

// TextStyle
final TextStyle title = GoogleFonts.roboto(
    color: whiteColor, fontSize: 25, fontWeight: FontWeight.w400);
final TextStyle title2 = GoogleFonts.gruppo(
    fontWeight: FontWeight.w800, color: whiteColor, fontSize: 20);
final TextStyle subtitle1 = GoogleFonts.rethinkSans(
    fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500);
final TextStyle subtitle2 = GoogleFonts.roboto(
  fontSize: 18,
  color: Colors.white,
);
final TextStyle subtitle3 = GoogleFonts.gruppo(
    fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800);

const String domain = 'https://api.openweathermap.org/data/2.5/weather?';

// const String Api_Key = 'b9271cdb9eee78818cf3470cacc77933';
