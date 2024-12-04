import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';

class CustomCard extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Clip clipBehavior;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final Decoration? foregroundDecoration;
  final List<BoxShadow>? boxShadow;

  CustomCard({
    super.key,
    this.alignment,
    this.padding = const EdgeInsets.all(8),
    this.color = ColorPallet.white,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.child,
    this.clipBehavior = Clip.none,
    this.borderRadius,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
    this.foregroundDecoration,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(constraints == null || constraints.debugAssertIsValid());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        shape: shape,
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(16.0),
        boxShadow: boxShadow ?? ColorPallet.cardShadow,
        border: Border.all(color: ColorPallet.greyBorderColor, width: 1),
        // boxShadow: ColorPallet.buttonShadow(color: ColorPallet.offWhite),
      ),
      foregroundDecoration: foregroundDecoration,
      child: child,
    );
  }
}
