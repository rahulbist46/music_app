import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/widgets/circular_back_button.dart';
import 'package:music_app/src/utilities/widgets/logo.dart';

class AuthTopRow extends StatelessWidget {
  const AuthTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircularBackButton(),
        SizedBox(
          width: Scale.screenWidht * 0.2,
        ),
        const Logo(
          scale: 1.5,
        ),
      ],
    );
  }
}
