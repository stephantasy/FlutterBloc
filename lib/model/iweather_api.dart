import 'package:bloc_pattern/model/weather.dart';

abstract class IWeatherApi{
  Future<Weather> fetchWeatherFromApi(String cityName);
}