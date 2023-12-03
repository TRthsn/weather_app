import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/theme/theme_dark.dart';
import 'package:weather_app/app/theme/theme_light.dart';
import 'package:weather_app/feature/home/view/home_page_view.dart';
import 'package:weather_app/service/cache/cache_manager.dart';
import 'package:weather_app/service/riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  final cacheTheme = await CacheManager.init().getTheme();
  runApp(ProviderScope(overrides: [
    getCacheWeatherProvider.overrideWithValue(cacheTheme),
  ], child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeLight().themeData,
        darkTheme: ThemeDark().themeData,
        themeMode: ref.watch(themeNotifierProvider),
        home: const HomePageView());
  }
}
