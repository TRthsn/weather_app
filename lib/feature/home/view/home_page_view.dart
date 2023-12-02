import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/app/constants/constants_String.dart';
import 'package:weather_app/app/constants/constants_decoration.dart';
import 'package:weather_app/app/constants/constants_text_style.dart';
import 'package:weather_app/feature/home/view_modal/home_page_view_modal.dart';
import 'package:weather_app/app/enum/lottie_assets.dart';
import 'package:weather_app/service/riverpod.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageViewState();
}

class _HomePageViewState extends HomePageViewModal<HomePageView> {
  ThemeMode isLight = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    isLight = ref.watch(themeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          GestureDetector(
            onTap: () {
              swichTheme();
            },
            child: LottieBuilder.asset(
              'anim_theme_swich.json',
              controller: animationController,
            ),
          )
        ],
      ),
      body: Padding(
          padding: ConstantsDecoration.homeMainPadding,
          child: Column(
            children: [
              Flexible(
                flex: ConstantsDecoration.flexHometextfield,
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      hintText: ConstantsString.texFieldHint,
                      suffixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                          borderRadius: ConstantsDecoration.textFieldRadius)),
                ),
              ),
              Flexible(
                  flex: ConstantsDecoration.flexHomeLottie,
                  child: LottieBuilder.asset(LottieAssets.storm.lottiePath)),
              const Spacer(
                flex: ConstantsDecoration.flexHomeSpacer,
              ),
              Flexible(
                  flex: ConstantsDecoration.flexHomeCelcius,
                  child: Text(
                    '13 C',
                    style: isLight == ThemeMode.light
                        ? const TextStyleConstants.weatherTextLight()
                        : const TextStyleConstants.weatherTextDark(),
                  )),
              const Spacer(
                flex: ConstantsDecoration.flexHomeSpacer,
              ),
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'data',
                        style: isLight == ThemeMode.light
                            ? const TextStyleConstants.weatherSubTextLight()
                            : const TextStyleConstants.weatherSubTextDark(),
                      ),
                      Text(
                        '1',
                        style: isLight == ThemeMode.light
                            ? const TextStyleConstants.weatherSubTextLight()
                            : const TextStyleConstants.weatherSubTextDark(),
                      )
                    ],
                  )),
              const Spacer(
                flex: ConstantsDecoration.flexHomeSpacerbottom,
              ),
            ],
          )),
    );
  }
}
