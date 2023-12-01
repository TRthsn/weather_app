import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/service/cache/cache_manager.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  ThemeNotifier({required CacheManager cacheManager})
      : _cacheManager = cacheManager,
        super() {
    getCurrentTheme();
  }
  final CacheManager _cacheManager;
  ThemeMode startMode = ThemeMode.light;

  Future<void> getCurrentTheme() async {
    startMode = await _cacheManager.getTheme();
  }

  Future<void> changeTheme() async {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
    await _cacheManager.setTheme(state);
  }

  @override
  ThemeMode build() {
    return startMode;
  }
}
