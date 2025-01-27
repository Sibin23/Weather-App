part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  final Position position;
  final String cityName;

  const FetchWeather(this.position, this.cityName);

  @override
  List<Object> get props => [position];
}

class FetchWeatherByCityName extends WeatherBlocEvent {
  final String cityName;

  const FetchWeatherByCityName(this.cityName);

  @override
  List<Object> get props => [cityName];
}
