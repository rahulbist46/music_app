import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/icon_from_image.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    this.width,
    this.icon,
    this.assetUrl,
    this.elevation,
    this.iconSize,
    this.color,
    this.iconColor,
    this.onTap,
    this.tag,
    this.mini = false,
  }) : assert(assetUrl == null || icon == null);
  final String? assetUrl;
  final Widget? icon;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final bool mini;
  final VoidCallback? onTap;
  final String? tag;
  final double? elevation;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Scale.screenWidht * 0.12,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: onTap,
        highlightElevation: elevation ?? 0,
        heroTag: tag ?? Random().nextInt(1000000),
        elevation: elevation ?? 3,
        mini: mini,
        backgroundColor: color ?? ColorPallet.white,
        child: icon ??
            IconFromImage(
              assetUrl!,
              size: iconSize ?? 22.toScale,
              color: iconColor ?? ColorPallet.darkBlueGrey,
            ),
      ),
    );
  }
}
