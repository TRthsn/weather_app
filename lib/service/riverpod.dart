import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/home/view_modal/theme_notifier.dart';
import 'package:weather_app/service/cache/cache_manager.dart';
import 'package:weather_app/service/modal/weather_modal.dart';
import 'package:weather_app/service/service_manager.dart';

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() {
  return ThemeNotifier(cacheManager: CacheManager.init());
});
final locationProvider = StateProvider<String?>((ref) => null);

final getWeatherProvider =
    AsyncNotifierProvider<ServiceManager, Weather?>(() => ServiceManager());

//We will fill this provider in Void Main
final getCacheWeatherProvider =
    Provider<ThemeMode>((ref) => throw UnimplementedError());
