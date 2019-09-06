import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/model/iweather_api.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherApi _weatherApi;

  WeatherBloc(this._weatherApi);

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      final weather = await _weatherApi.fetchWeatherFromApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }
}
