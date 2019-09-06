import 'dart:math';

import 'package:bloc_pattern/model/iweather_api.dart';
import 'package:bloc_pattern/model/weather.dart';

class WeatherApi implements IWeatherApi {
  @override
  Future<Weather> fetchWeatherFromApi(String cityName) {
    return _fetchWeatherFromFakeApi(cityName);
  }

  // TEMP: Fake API 
  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(Duration(seconds: 1), () {
      return Weather(
        cityName: cityName,
        temperature: 15 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }
}
