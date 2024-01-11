import 'package:weather_app/model/weather_model.dart';

abstract class WeatherStates {}

class WeatherIntialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WheatherModel wheatherModel;

  WeatherLoadedState({required this.wheatherModel});
}

class WeatherFaluireState extends WeatherStates {
  final String errprMessage;

  WeatherFaluireState({required this.errprMessage});
}
