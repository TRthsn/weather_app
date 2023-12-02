import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/service/riverpod.dart';

abstract class HomePageViewModal<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with TickerProviderStateMixin {
  late final AnimationController animationController;

  ThemeMode getCurrentTheme() {
    return ref.watch(themeNotifierProvider);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        value: ref.read(themeNotifierProvider) == ThemeMode.light ? 0.5 : 0);
  }

  void swichTheme() {
    getCurrentTheme() == ThemeMode.dark
        ? animationController.animateTo(0.5)
        : animationController.animateTo(0);
    ref.read(themeNotifierProvider.notifier).changeTheme();
  }

  void getWeather() {
    String currentCity = '';
  }
}
