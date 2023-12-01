import 'package:flutter/material.dart';
import 'package:weather_app/app/theme/theme_base.dart';
import 'package:weather_app/app/theme/theme_color_schemes.dart';

class ThemeLight extends ThemeBase {
  @override
  ThemeData get themeData =>
      ThemeData(colorScheme: ThemeColorSchemes.light, useMaterial3: true);
}
