import 'package:bloc_pattern/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const <dynamic>[]]) : super(props);
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {
  final Weather weather;
// Equatable allows for a simple value equality in Dart.
  // All you need to do is to pass the class fields to the super constructor.
  WeatherLoaded(this.weather) : super([weather]);
}
