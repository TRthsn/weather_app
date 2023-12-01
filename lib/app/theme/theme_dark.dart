import 'package:flutter/material.dart';
import 'package:weather_app/app/theme/theme_base.dart';
import 'package:weather_app/app/theme/theme_color_schemes.dart';

class ThemeDark extends ThemeBase {
  @override
  ThemeData get themeData =>
      ThemeData(colorScheme: ThemeColorSchemes.dark, useMaterial3: true);
}
