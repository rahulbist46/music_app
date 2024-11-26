import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetExtensions on Widget {
  Widget glassMorphism({
    double frostValue = 16.0,
    Color? frostColor,
    double radiusCurve = 8.0,
    BorderRadiusGeometry? radius,
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(radiusCurve),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: frostValue, sigmaY: frostValue),
        child: Container(
          color: frostColor ?? Colors.grey.shade600.withOpacity(0.2),
          child: this,
        ),
      ),
    );
  }

  Widget shimmer({double? radius}) {
    return Shimmer.fromColors(
      baseColor: ColorPallet.lightGrey,
      highlightColor: ColorPallet.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPallet.white,
          borderRadius: BorderRadius.circular(radius ?? 20.toScale),
        ),
        child: this,
      ),
    );
  }
}
