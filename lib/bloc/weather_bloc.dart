import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/model/iweather_api.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  IWeatherApi weatherApi;

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final weather = await weatherApi.fetchWeatherFromApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }
}
