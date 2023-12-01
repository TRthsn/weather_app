import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  CacheManager._();
  //Singleton----------------------------------------------------
  static CacheManager? _cacheManager;
  factory CacheManager.init() => _cacheManager ??= CacheManager._();
  //SharedPref object--------------------------------------------
  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> setIntance() async {
    if (_sharedPreferences == null) {
      return await SharedPreferences.getInstance();
    } else {
      return _sharedPreferences!;
    }
  }

  //set theme----------------------------------------------------
  Future<void> setTheme(ThemeMode themeMode) async {
    final prefs = await setIntance();
    bool isLight = true;
    themeMode == ThemeMode.dark ? isLight = false : null;
    await prefs.setBool('theme', isLight);
  }

  //get theme----------------------------------------------------
  Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isLight;

    isLight = prefs.getBool('theme');

    if (isLight == false) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
