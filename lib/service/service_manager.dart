import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/service/modal/weather_modal.dart';
import 'package:http/http.dart' as http;

class ServiceManager {
  final base_url = dotenv.env['BASE_URL'];
  final api_key = dotenv.env['API_KEY'];

  Future<Weather> getWeather(String location) async {
    final response = await http
        .get(Uri.parse('$base_url?q=$location&appid=$api_key&units=metric'));
    if (response.statusCode == HttpStatus.ok) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
