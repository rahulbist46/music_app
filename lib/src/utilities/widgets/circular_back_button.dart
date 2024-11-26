import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/hero_tags.dart';

class CircularBackButton extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final String? tag;
  final Color? iconColor;
  final double? elevation;
  final VoidCallback? customCallback;
  const CircularBackButton(
      {super.key,
      this.color,
      this.margin,
      this.tag,
      this.iconColor,
      this.elevation,
      this.customCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      alignment: Alignment.topLeft,
      child: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: customCallback ?? () => Navigator.pop(context),
        heroTag: tag ?? HeroTags.circularBackButton,
        elevation: elevation ?? 3,
        backgroundColor: color ?? ColorPallet.white,
        child: Icon(
          FluentIcons.arrow_left_16_regular,
          size: 26.toScale,
          color: iconColor ?? ColorPallet.darkBlueGrey,
        ),
      ),
    );
  }
}
