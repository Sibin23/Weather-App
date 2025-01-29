import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/presentation/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/presentation/common_widgets/background_ui.dart';
import 'package:weather_app/presentation/common_widgets/search_field.dart';
import 'package:weather_app/presentation/common_widgets/weather_error_screen.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  final Position initialPosition;
  final String cityName;

  const HomeScreen(
      {super.key, required this.initialPosition, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final size = MediaQuery.of(context).size;
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
        body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
            builder: (context, state) {
          if (state is WeatherBlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherBlocSuccess) {
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SizedBox(
                child: Stack(
                  children: [
                    BackgroundUi(mainCondition: state.weather.mainCondition),
                    WeatherScreen(
                      size: size,
                      weather: state.weather,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherErrorState) {
            return WeatherErrorScreen(
              voidCallback: () {
                context
                    .read<WeatherBlocBloc>()
                    .add(FetchWeatherByCityName(cityName));
              },
            );
          } else {
            return const Center(
              child: Text(
                'Please enter a location to search',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        }));
  }
}

