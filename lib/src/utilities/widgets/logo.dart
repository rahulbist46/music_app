import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.height,
    this.width,
    this.scale,
    this.color,
  });
  final double? height;
  final double? width;
  final double? scale;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.logo,
      scale: scale,
      height: height,
      width: width,
      color: color,
      fit: BoxFit.fill,
    );
  }
}
