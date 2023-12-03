import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/enum/lottie_assets.dart';
import 'package:weather_app/service/modal/weather_modal.dart';
import 'package:weather_app/service/riverpod.dart';
import 'package:weather_app/service/service_manager.dart';

abstract class HomePageViewModal<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final TextEditingController textEditingController;
  late final ServiceManager serviceManager;
  ThemeMode isLight = ThemeMode.light;
  String? location;

  Future<ThemeMode?> getCurrentTheme() async {
    return ref.watch(themeNotifierProvider);
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        value: ref.read(themeNotifierProvider) == ThemeMode.light ? 0.5 : 0);
    serviceManager = ServiceManager();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    animationController.dispose();
  }

  Future<void> swichTheme() async {
    final currentThemeMode = await getCurrentTheme();
    currentThemeMode == ThemeMode.dark
        ? animationController.animateTo(0.5)
        : animationController.animateTo(0);
    ref.read(themeNotifierProvider.notifier).changeTheme();
  }

  Future<Weather?> getWeather() async {
    location = textEditingController.text.trim();
    if (location != null) {
      return await serviceManager.getWeather();
    } else {
      return null;
    }
  }

  String getCelciusText(Weather? weather) {
    if (weather == null) {
      return 'City Not Found';
    } else {
      return '${weather.temprature?.round()} C';
    }
  }

  String getLottieAssetPath(Weather? weather) {
    if (weather == null) {
      return LottieAssets.notFound.lottiePath;
    } else if (weather.condition!.toLowerCase() == "clear") {
      return LottieAssets.sunny.lottiePath;
    } else if (weather.condition!.toLowerCase() == "rain") {
      return LottieAssets.storm.lottiePath;
    } else if (weather.condition!.toLowerCase() == "snow") {
      return LottieAssets.snow.lottiePath;
    } else if (weather.condition!.toLowerCase() == "mist") {
      return LottieAssets.mist.lottiePath;
    } else {
      return LottieAssets.windy.lottiePath;
    }
  }
}
