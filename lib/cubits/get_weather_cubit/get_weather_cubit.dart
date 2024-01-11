import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherIntialState());
  WheatherModel? wheatherModel;
  getWeather({required String cityName}) async {
    try {
      wheatherModel = await WeatherServices(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(wheatherModel: wheatherModel!));
    } catch (e) {
      emit(WeatherFaluireState(errprMessage: e.toString()));
    }
  }
}
