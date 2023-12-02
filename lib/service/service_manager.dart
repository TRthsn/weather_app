import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/service/modal/weather_modal.dart';
import 'package:dio/dio.dart';

class ServiceManager {
  final base_url = dotenv.env['BASE_URL'];
  final api_key = dotenv.env['API_KEY'];

  Future<Weather> getWeather(String location) async {
    final response =
        await Dio().get('$base_url?q=$location&appid=$api_key&units=metric');
    if (response.statusCode == HttpStatus.ok) {
      final cacheData = response.data;
      if (cacheData is Map<String, dynamic>) {
        return Weather.fromJson(cacheData);
      } else {
        throw Exception('Map is null');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
