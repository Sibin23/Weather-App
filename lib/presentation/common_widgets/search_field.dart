import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/presentation/bloc/weather_bloc_bloc.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CupertinoTextField(
        
        prefix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
            color: whiteColor.withOpacity(0.8),
          ),
        ),
        controller: controller,
        placeholder: 'Search City Name',
        placeholderStyle: subtitle3,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.1),
          borderRadius: radius12,
        ),
        onChanged: (query) {
          if (query.isEmpty) {
            controller.clear();
          } else {
            BlocProvider.of<WeatherBlocBloc>(context)
                .add(FetchWeatherByCityName(controller.text));
          }
        },
        onSubmitted: (query) {
          if (query.isEmpty) {
            controller.clear();
          } else {
            BlocProvider.of<WeatherBlocBloc>(context)
                .add(FetchWeatherByCityName(controller.text));
          }
        },
        suffix: GestureDetector(
          onTap: () {
            BlocProvider.of<WeatherBlocBloc>(context)
                .add(const FetchWeatherByCityName('Dubai'));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              CupertinoIcons.xmark_circle_fill,
              color: whiteColor,
              size: 35,
            ),
          ),
        ),
        style: subtitle2,
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
