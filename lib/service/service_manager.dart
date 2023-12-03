import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/service/modal/weather_modal.dart';
import 'package:weather_app/service/riverpod.dart';

class ServiceManager extends AsyncNotifier<Weather?> {
  ServiceManager();
  final _base_url = dotenv.env['BASE_URL'];
  final _api_key = dotenv.env['API_KEY'];

  Future<Weather?> getWeather() async {
    final location = ref.watch(locationProvider);
    final response = await http.get(Uri.parse(
        'https://$_base_url?q=$location&appid=$_api_key&units=metric'));
    if (response.statusCode == HttpStatus.ok) {
      final jsonData = jsonDecode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      return null;
    }
  }

  @override
  FutureOr<Weather?> build() {
    return getWeather();
  }
}
