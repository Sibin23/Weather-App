import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/services/weather_service.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final WeatherService weatherService;
  WeatherBlocBloc(this.weatherService) : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        final weather =
            await weatherService.fetchWeatherByCityName(event.cityName);
        if (weather != null) {
          emit(WeatherBlocSuccess(weather));
        }else{
          emit(WeatherErrorState());
        }

      } catch (e) {
        emit(WeatherErrorState());
      }
    });
    on<FetchWeatherByCityName>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        final weather =
            await weatherService.fetchWeatherByCityName(event.cityName);
        if (weather != null) {
          emit(WeatherBlocSuccess(weather));
        } else {
          emit(WeatherErrorState());
        }
      } catch (e) {
        emit(WeatherErrorState());
      }
    });
  }
}
