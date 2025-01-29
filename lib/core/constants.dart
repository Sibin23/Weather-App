import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String apiKey = 'f302292fbb6c5976038c6c1191526de8';

// Colors
const Color primaryColor1 = Color.fromARGB(255, 112, 131, 255);
const Color primaryColor2 = Color.fromARGB(255, 255, 112, 248);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color redColor = Colors.red;

const h10 = SizedBox(height: 10);
const h20 = SizedBox(height: 20);
const h30 = SizedBox(height: 30);

const w10 = SizedBox(width: 10);
const w20 = SizedBox(width: 20);
const w30 = SizedBox(width: 30);

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
final TextStyle subtitle2 = GoogleFonts.gruppo(
    fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800);
final subtitle3 =
    GoogleFonts.roboto(color: whiteColor.withOpacity(0.6), fontSize: 18);

// images
// const String cloudy = 'assets/images/Cloudy.png';
// const String sunny = 'assets/images/Sunny.png';
// const String rainy = 'assets/images/Rainy.png';
// const String snowy = 'assets/images/Snow.png';
// const String mist = 'assets/images/Mist.png';
// const String thunderstorm = 'assets/images/Thundrstorm.png';
// const String sunrise = 'assets/images/Sunrise.png';
// const String sunset = 'assets/images/Sunset.png';
// const String temperatureMax = 'assets/images/temp_Max.png';
// const String temperatureMin = 'assets/images/temp_min.png';

const String domain = 'https://api.openweathermap.org/data/2.5/weather?';

// const String Api_Key = 'b9271cdb9eee78818cf3470cacc77933';
