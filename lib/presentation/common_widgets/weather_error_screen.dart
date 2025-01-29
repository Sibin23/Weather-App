import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/presentation/bloc/weather_bloc_bloc.dart';

class WeatherErrorScreen extends StatelessWidget {
  const WeatherErrorScreen({super.key, required this.voidCallback});
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Stack(
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
                      shape: BoxShape.circle, color: Colors.orange.shade400),
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
              Center(
                child: Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        color: whiteColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h30,
                          Text(
                            'Failed !',
                            style: title,
                          ),
                          Icon(
                            Icons.error_outline_outlined,
                            size: 100,
                            color: redColor.withOpacity(0.7),
                          ),
                          h30,
                          Text(
                            'Unable to retrieve weather information. Please enter an alternative city name.',
                            style: GoogleFonts.roboto(
                              color: whiteColor.withOpacity(0.4),
                              fontSize: 14,
                            ),
                          ),
                          h10,
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<WeatherBlocBloc>()
                                  .add(const FetchWeatherByCityName('Dubai'));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: whiteColor.withOpacity(0.2),
                            ),
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
