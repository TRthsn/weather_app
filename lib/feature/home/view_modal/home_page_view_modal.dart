import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/home/view_modal/riverpod.dart';

abstract class HomePageViewModal<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with TickerProviderStateMixin {
  late final AnimationController animationController;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void swichTheme() {
    ref.read(themeNotifierProvider.notifier).changeTheme();
    isOpen
        ? animationController.animateTo(0)
        : animationController.animateTo(0.5);
    isOpen = !isOpen;
  }
}
