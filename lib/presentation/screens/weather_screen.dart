import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/data/model/weather_model.dart';

class WeatherScreen extends StatelessWidget {
  final Weather weather;
  final Size size;
  const WeatherScreen({super.key, required this.weather, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Positioned(
              top: 140,
              left: 0,
              right: 0,
              child: Image.asset(
                getWeatherImages(weather.mainCondition),
                fit: BoxFit.cover,
                height: 300,
                width: 200,
              ),
            ),
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
                            weather.cityName,
                            style: subtitle2,
                          ),
                          Text(
                            getGreeting(DateTime.parse(weather.datetime)),
                            style: subtitle1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 240,
                    ),
                    Text(
                      '${weather.temperature.round()}°C',
                      style: GoogleFonts.publicSans(
                          color: whiteColor, fontSize: 100),
                    ),
                    Text(
                      weather.mainCondition,
                      style: title2,
                    ),
                    Text(
                      DateFormat('EEEE dd •')
                          .add_jm()
                          .format(DateTime.parse(weather.datetime)),
                      style: subtitle3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '☀️',
                              style: TextStyle(fontSize: 40),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunrise',
                                  style: subtitle3,
                                ),
                                Text(
                                  DateFormat()
                                      .add_jm()
                                      .format(DateTime.parse(weather.sunRise)),
                                  style: subtitle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              '🌙',
                              style: TextStyle(fontSize: 40),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: subtitle3,
                                ),
                                Text(
                                  DateFormat()
                                      .add_jm()
                                      .format(DateTime.parse(weather.sunSet)),
                                  style: subtitle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    h10,
                    Divider(
                      thickness: 2,
                      color: whiteColor.withOpacity(0.2),
                    ),
                    h10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/temp_Max.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'High',
                                  style: subtitle3,
                                ),
                                Text(
                                  '${weather.maxTemp.round()}°C',
                                  style: subtitle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/temp_Min.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Low',
                                  style: subtitle3,
                                ),
                                Text(
                                  '${weather.minTemp.round()}°C',
                                  style: subtitle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getGreeting(DateTime dateTime) {
  final hour = dateTime.hour;
  if (hour >= 0 && hour < 12) {
   return "Good Morning";
  } else if (hour >= 12 && hour < 16) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
 
}

String getWeatherImages(String mainCondition) {
  switch (mainCondition.toLowerCase()) {
    case 'clouds':
      return 'assets/images/Cloudy.png';
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/images/Mist.png';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/images/Rainy.png';
    case 'thunderstorm':
      return 'assets/images/Thunderstorm.png';
    case 'clear':
      return 'assets/images/Sunny.png';
    case 'snow':
      return 'assets/images/Snow.png';
    default:
      return 'assets/images/Cloudy.png';
  }
}
