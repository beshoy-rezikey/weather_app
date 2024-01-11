import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String domain = 'http://api.weatherapi.com/v1';
  final String apiKey = '78fea9f6e0484826999133635232411';

  WeatherServices({required this.dio});

  Future<WheatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$domain/forecast.json?key=$apiKey&q=$cityName&days=1');

      WheatherModel wheatherModel = WheatherModel.fromJson(response.data);
      return wheatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was unknown error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('error, try later ');
    }
  }
}
