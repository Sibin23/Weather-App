import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/core/constants.dart';

class BackgroundUi extends StatelessWidget {
  final String mainCondition;
  const BackgroundUi({super.key, required this.mainCondition});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getBackgroundColor(mainCondition)),
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
    );
  }
}Color getBackgroundColor(String mainCondition) {
  switch (mainCondition.toLowerCase()) {
    case 'clouds':
      return Colors.blue.shade100;
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return Colors.lightBlue.shade200;
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return Colors.white60;
    case 'thunderstorm':
      return Colors.white54;
    case 'clear':
      return Colors.orange.shade400;
    case 'snow':
      return Colors.white70;
    default:
      return Colors.orange.shade400;
  }
}


