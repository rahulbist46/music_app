import 'package:flutter/material.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/assets.dart';
import 'package:music_app/src/utilities/string.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/button.dart';
import 'package:music_app/src/utilities/widgets/logo.dart';
import 'package:music_app/src/view/intro/chose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                image: AssetImage(Assets.introBackground),
              ),
            ),
            child: Column(
              children: [
                // Logo
                const Logo(),
                const Spacer(),

                // App Name
                const Text(
                  Strings.beatBox,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Intro Text
                const Text(
                  Strings.introText,
                  style: TextStyle(
                    color: ColorPallet.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Get Started Button
                Button(
                  onTap: () {
                    debugPrint("Get Started Button Pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChoseMode(),
                      ),
                    );
                  },
                  text: Strings.getStarted,
                  textStyle: ThemeService.headline6.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.white),
                  height: 70,
                )
              ],
            ),
          ),

          // Overlay
        ],
      ),
    );
  }
}
