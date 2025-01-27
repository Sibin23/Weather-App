import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants.dart';

import 'package:weather_app/data/model/weather_model.dart';

class WeatherService {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  Future<Weather?> fetchWeatherByCityName(String cityName) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Weather.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: ${e.toString()}');
    }
  }
}
