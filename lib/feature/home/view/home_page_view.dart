import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/app/constants/constants_String.dart';
import 'package:weather_app/app/constants/constants_decoration.dart';
import 'package:weather_app/app/constants/constants_text_style.dart';
import 'package:weather_app/feature/home/view_modal/home_page_view_modal.dart';
import 'package:weather_app/app/enum/lottie_assets.dart';
import 'package:weather_app/service/modal/weather_modal.dart';
import 'package:weather_app/service/riverpod.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageViewState();
}

class _HomePageViewState extends HomePageViewModal<HomePageView> {
  @override
  Widget build(BuildContext context) {
    isLight = ref.watch(themeNotifierProvider) ?? ThemeMode.light;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [themeChangeSwich()],
      ),
      body: Padding(
          padding: ConstantsDecoration.homeMainPadding,
          child: Column(
            children: [
              Flexible(
                flex: ConstantsDecoration.flexHometextfieldBand,
                child: SizedBox(
                  height: ConstantsDecoration.textFieldAndButton,
                  child: Row(children: [
                    Expanded(
                        flex: ConstantsDecoration.flexHometextfield,
                        child: Container(child: weatherTextField())),
                    Expanded(
                      flex: ConstantsDecoration.flexHomeButton,
                      child: weatherSelectButton(),
                    )
                  ]),
                ),
              ),
              ref.watch(locationProvider) == null
                  ? pleaseSelectLottieAndText()
                  : ref.watch(getWeatherProvider).when(
                      data: (Weather? weather) {
                        return Flexible(
                            flex:
                                ConstantsDecoration.homeLottieAndWeatherSubText,
                            child: homeLottieAndWeatherSubText(weather));
                      },
                      error: (_, StackTrace stackTrace) =>
                          throw Exception(stackTrace.toString()),
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          )),
            ],
          )),
    );
  }

  Column homeLottieAndWeatherSubText(Weather? weather) {
    return Column(
      children: [
        Flexible(
            flex: ConstantsDecoration.flexHomeLottie,
            child: LottieBuilder.asset(getLottieAssetPath(weather))),
        const Spacer(
          flex: ConstantsDecoration.flexHomeSpacer,
        ),
        Flexible(
            flex: ConstantsDecoration.flexHomeCelcius,
            child: celciusText(weather)),
        Flexible(
            flex: ConstantsDecoration.flexHomeWeatherSubText,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  weather?.name ?? '',
                  style: isLight == ThemeMode.light
                      ? const TextStyleConstants.weatherSubTextLight()
                      : const TextStyleConstants.weatherSubTextDark(),
                ),
                Text(
                  weather?.condition ?? '',
                  style: isLight == ThemeMode.light
                      ? const TextStyleConstants.weatherSubTextLight()
                      : const TextStyleConstants.weatherSubTextDark(),
                )
              ],
            )),
      ],
    );
  }

  Flexible pleaseSelectLottieAndText() {
    return Flexible(
        flex: ConstantsDecoration.pleaseSelectLottieAndText,
        child: Center(
            child: Column(
          children: [
            const Spacer(
              flex: ConstantsDecoration.spacer,
            ),
            Flexible(
                flex: ConstantsDecoration.lottie,
                child: LottieBuilder.asset(LottieAssets.select.lottiePath)),
            const Spacer(
              flex: ConstantsDecoration.spacer,
            ),
            Flexible(
              flex: ConstantsDecoration.selectLoacationText,
              child: Text(
                'Please select locations',
                style: isLight == ThemeMode.light
                    ? const TextStyleConstants.weatherTextLight()
                    : const TextStyleConstants.weatherTextDark(),
              ),
            ),
          ],
        )));
  }

  InkWell weatherSelectButton() {
    return InkWell(
      onTap: () => ref.read(locationProvider.notifier).state =
          textEditingController.text,
      child: Container(
        color: ConstantsDecoration.homeButtonColor,
        height: ConstantsDecoration.textFieldAndButton,
        child: const Icon(Icons.location_on),
      ),
    );
  }

  Text celciusText(Weather? weather) {
    return Text(
      getCelciusText(weather),
      style: isLight == ThemeMode.light
          ? const TextStyleConstants.weatherTextLight()
          : const TextStyleConstants.weatherTextDark(),
    );
  }

  TextField weatherTextField() {
    return TextField(
      controller: textEditingController,
      decoration: const InputDecoration(
          hintText: ConstantsString.texFieldHint, border: OutlineInputBorder()),
    );
  }

  GestureDetector themeChangeSwich() {
    return GestureDetector(
      onTap: () {
        swichTheme();
      },
      child: LottieBuilder.asset(
        'anim_theme_swich.json',
        controller: animationController,
      ),
    );
  }
}
