import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';

class NormalAndBoldText extends StatelessWidget {
  const NormalAndBoldText({
    super.key,
    required this.normalText,
    required this.boldText,
    this.normalStyle,
    this.boldStyle,
    this.subText,
    this.onBoldTap,
    this.alignment,
    this.spaceBetweenTitleAndSubtitle,
    this.crossAxisAlignment,
  });

  final String normalText;
  final String boldText;
  final TextStyle? normalStyle;
  final TextStyle? boldStyle;
  final String? subText;
  final VoidCallback? onBoldTap;
  final TextAlign? alignment;
  final double? spaceBetweenTitleAndSubtitle;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text.rich(
          TextSpan(
            text: normalText,
            children: <InlineSpan>[
              TextSpan(
                text: boldText,
                style: boldStyle ?? ThemeService.boldBlack,
                recognizer: TapGestureRecognizer()..onTap = onBoldTap,
              )
            ],
          ),
          textAlign: alignment,
          style: normalStyle ?? ThemeService.titleStyle,
        ),
        SizedBox(height: spaceBetweenTitleAndSubtitle),
        if (subText != null)
          Text(
            subText!,
            textAlign: alignment,
            style: ThemeService.subTitleStyle,
          ),
      ],
    );
  }
}
