import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/presentation/common_widgets/search_field.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: whiteColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SearchField(controller: searchController),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: blackColor,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200)),
                ),
                Positioned(
                  top: -20,
                  left: 20,
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100)),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: -50,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 13, 25, 161)),
                  ),
                ),
                Positioned(
                  top: 500,
                  right: -40,
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 13, 25, 161)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 200,
                    width: size.width,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle, color: blackColor),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                  ),
                ),
              ],
            ),
          ),

          // Ui content

          SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jakarta',
                                  style: subtitle3,
                                ),
                                Text(
                                  'Good Morning',
                                  
                                  style: subtitle1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 240,
                          ),
                          Text(
                            '21°C',
                            style: GoogleFonts.publicSans(
                                color: whiteColor, fontSize: 100),
                          ),
                          Text(
                            'THUNDERSTORM',
                            style: title2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/clear.png',
                      fit: BoxFit.cover,
                      height: 300,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
