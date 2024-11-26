import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/assets.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/string.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/button.dart';
import 'package:music_app/src/utilities/widgets/logo.dart';
import 'package:music_app/src/view/intro/start.dart';

class ChoseMode extends StatelessWidget {
  const ChoseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.modeBackground),
              ),
            ),
            child: Column(
              children: [
                const Logo(),
                const Spacer(),
                Text("Chose One",
                    style: ThemeService.headline3
                        .copyWith(color: ColorPallet.white)),
                SizedBox(
                  height: Scale.screenHeight * 0.05,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconAndName(
                        icon: FluentIcons.weather_sunny_16_regular,
                        text: Strings.lightMode),
                    IconAndName(
                        icon: FluentIcons.weather_moon_16_regular,
                        text: Strings.darkmode)
                  ],
                ),
                const SizedBox(height: 80),
                Button(
                  onTap: () {
                    debugPrint("Get Started Button Pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpotifyScreen(),
                      ),
                    );
                  },
                  text: Strings.next,
                  textStyle: ThemeService.headline6.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.white),
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconAndName extends StatelessWidget {
  final IconData? icon;

  final String text;
  const IconAndName({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: ColorPallet.black.withOpacity(0.5),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: Scale.screenHeight * 0.005,
        ),
        Text(
          text,
          style: ThemeService.bodyText1
              .copyWith(fontWeight: FontWeight.w600, color: ColorPallet.white),
        ),
      ],
    );
  }
}
