import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/services/cubit/is_sign_up_cubit.dart';
import 'package:music_app/src/utilities/assets.dart';
import 'package:music_app/src/utilities/navigation.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/string.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/button.dart';
import 'package:music_app/src/utilities/widgets/circular_back_button.dart';
import 'package:music_app/src/utilities/widgets/logo.dart';

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Back Button
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0),
              child: Align(
                  alignment: Alignment.topLeft, child: CircularBackButton()),
            ),
            // SizedBox(
            //   height: Scale.screenHeight * 0.2,
            // ),
            const Spacer(),
            const Logo(),
            SizedBox(
              height: Scale.screenHeight * 0.04,
            ),
            const Text(
              'Enjoy Listening To Music',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Scale.screenHeight * 0.02,
            ),
            const Text(
              'Spotify is a proprietary Swedish audio\nstreaming and media services provider',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Scale.screenHeight * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  width: Scale.screenWidht * 0.3,
                  onTap: () {
                    // context.read<IsSignUpCubit>().change();

                    Navigator.pushNamed(context, Navigation.authScreen);
                  },
                  height: 60,
                  text: Strings.login,
                ),
                Button(
                  border: Border.all(color: ColorPallet.greyBorderColor),
                  onTap: () {
                    context.read<IsSignUpCubit>().change();
                    Navigator.pushNamed(context, Navigation.authScreen);
                  },
                  width: Scale.screenWidht * 0.3,
                  height: 60,
                  text: Strings.signUp,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600, // Ensures bold styling
                  ),
                  color: ColorPallet.white,
                )
              ],
            ),
            // const Spacer(),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(Assets.authStart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
