// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    this.color = ColorPallet.green,
    this.text = 'Tap',
    this.prefixIcon,
    this.suffixIcon,
    this.radius = 12.0,
    this.padding,
    this.width,
    this.height,
    this.textStyle,
    this.shadowColor,
    this.isLoading = false,
    this.showShadow = false,
    this.border,
  });

  final VoidCallback? onTap;
  final Color color;
  final String text;
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isLoading;
  final bool showShadow;
  final Color? shadowColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Container(
        height: height,
        width: width,
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 22.toScale,
              vertical: 12.toScale,
            ),
        decoration: BoxDecoration(
          color: color,
          boxShadow:
              showShadow ? ColorPallet.buttonShadow(color: shadowColor) : null,
          borderRadius: BorderRadius.circular(radius),
          border: border,
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                prefixIcon!,
                // SizedBox(width: 9.toScale),
              ],
              Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle ??
                    ThemeService.bodyText1.copyWith(
                      color: ColorPallet.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (suffixIcon != null) ...[
                SizedBox(width: 10.toScale),
                suffixIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
