import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.obsecure = false,
    this.autofocus = false,
    this.hintText,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.prefixIconPadding,
    this.prefixWidget,
    this.focusNode,
    this.radius,
    this.suffix,
    this.validationText,
    this.maxLength,
    this.keyboardType,
    this.inputAction,
    this.contentPadding,
    this.onTap,
    this.digitsOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.fillColor,
    this.borderColor,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obsecure;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final IconData? prefixIcon;
  final EdgeInsetsGeometry? prefixIconPadding;
  final Widget? prefixWidget;
  final FocusNode? focusNode;
  final bool autofocus;
  final double? radius;
  final Widget? suffix;
  final int maxLines;
  final int minLines;
  final bool enabled;
  final String? validationText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final bool digitsOnly;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final Color? fillColor;
  final Color? borderColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enabled ? 1 : 0.4,
      child: TextFormField(
        controller: widget.controller,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        style: ThemeService.bodyText1.copyWith(
          color: ColorPallet.black,
        ),
        obscureText: widget.obsecure,
        validator: widget.validator ??
            (String? value) {
              if (value == null || value.isEmpty) return widget.validationText;
              return null;
            },
        onChanged: widget.onChanged,
        cursorColor: ColorPallet.black,
        autofocus: widget.autofocus,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        textInputAction: widget.inputAction,
        keyboardType:
            widget.digitsOnly ? TextInputType.number : widget.keyboardType,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(widget.maxLength),
          if (widget.digitsOnly) FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: widget.hintText,
          isDense: true,
          contentPadding: widget.contentPadding ?? EdgeInsets.zero,
          hintStyle: ThemeService.bodyText1.copyWith(
            color: ColorPallet.black.withOpacity(0.8),
          ),
          filled: widget.enabled,
          fillColor: widget.fillColor ?? ColorPallet.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.black,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor ?? Colors.black12),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.transparent,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorPallet.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
          ),
          prefixIcon: _getPrefixIcon(),
          suffixIcon: widget.suffix,
        ),
      ),
    );
  }

  Widget? _getPrefixIcon() {
    if (widget.prefixIcon != null || widget.prefixWidget != null) {
      return Container(
        width: 42.toScale,
        height: widget.minLines * 21.1,
        alignment: (widget.maxLines > 1 && widget.minLines > 1)
            ? Alignment.topCenter
            : Alignment.center,
        child: widget.prefixWidget ??
            Icon(
              widget.prefixIcon!,
              color: ColorPallet.black,
              size: 18.toScale,
            ),
      );
    }
    return null;
  }
}
