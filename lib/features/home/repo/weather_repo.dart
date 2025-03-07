// const apiUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=9c1d66328b9945adb10e6a9e20abac52ps://api.openweathermap.org/data/2.5/weather?q=London';

import 'package:day4/features/home/model/weather.dart';
import 'package:dio/dio.dart';

const apiUrl =
    "https://api.weatherapi.com/v1/current.json?key=8587a2cd4567457d9f615102250703&q=KTM";

class WeatherRepo {
  static Future<WeatherModel> getWeather() async {
    try {
      final response = await Dio().get(apiUrl);
      final data = response.data;
      final weatherModel = WeatherModel.fromJson(data);

      return weatherModel;
    } on DioException catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
