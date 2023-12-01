import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/home/view_modal/theme_notifier.dart';
import 'package:weather_app/service/cache/cache_manager.dart';

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeMode>(() {
  return ThemeNotifier(cacheManager: CacheManager.init());
});
