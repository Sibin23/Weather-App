import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presentation/common_widgets/search_field.dart';
import 'package:weather_app/presentation/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  final Position initialPosition;
  final String cityName;

  HomeScreen(
      {super.key, required this.initialPosition, required this.cityName});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        title: Row(
          children: [
            Expanded(child: SearchField(controller: _searchController)),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus(); // Hide the keyboard
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -0.6),
                    child: Container(
                      height: 350,
                      width: 300,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                            Color.fromARGB(255, 112, 131, 255),
                            Color.fromARGB(255, 255, 112, 248),
                          ])),
                    ),
                  ),
                  BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                    builder: (context, state) {
                      if (state is WeatherBlocSuccess) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '📍 ${state.weather.cityName}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _searchController.clear();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        const WeatherScreen()));
                                            // BlocProvider.of<WeatherBlocBloc>(
                                            //         context)
                                            //     .add(FetchWeather(
                                            //         initialPosition, 'Maradu'));
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Center(
                                  child: Lottie.asset(
                                    getWeatherAnimation(
                                      state.weather.mainCondition.toUpperCase(),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${state.weather.temperature.round()}°C',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    state.weather.mainCondition.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    DateFormat('EEEE dd •').add_jm().format(
                                        DateTime.parse(state.weather.datetime)),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            child: Lottie.asset(
                                                'assets/lottie/S-Sunrise.json',
                                                fit: BoxFit.cover),
                                          ),
                                          const Text(
                                            'Sunrise',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            DateFormat().add_jm().format(
                                                DateTime.parse(
                                                    state.weather.sunRise)),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            child: Lottie.asset(
                                                'assets/lottie/S-Sunset.json',
                                                fit: BoxFit.cover),
                                          ),
                                          const Text(
                                            'SunSet',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            DateFormat().add_jm().format(
                                                DateTime.parse(
                                                    state.weather.sunSet)),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            child: Lottie.asset(
                                                'assets/lottie/S-Temp max.json',
                                                fit: BoxFit.cover),
                                          ),
                                          const Text(
                                            'Temp Max',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "${state.weather.maxTemp.round()} °C",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            child: Lottie.asset(
                                                'assets/lottie/S-Temp min.json',
                                                fit: BoxFit.cover),
                                          ),
                                          const Text(
                                            'Temp Min',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "${state.weather.minTemp.round()} °C",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (state is WeatherBlocLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is WeatherErrorState) {
                        return const Center(
                          child: Text(
                            'Failed to fetch weather data ',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Please enter a location to search',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String getWeatherAnimation(String mainCondition) {
  switch (mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/lottie/windy.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/lottie/sun with rain.json';
    case 'thunderstorm':
      return 'assets/lottie/thunder.json';
    case 'clear':
      return 'assets/lottie/sunny.json';
    default:
      return 'assets/lottie/sunny.json';
  }
}
