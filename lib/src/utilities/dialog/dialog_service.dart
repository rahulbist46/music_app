import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/extensions/on_strings.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/button.dart';
import 'package:music_app/src/utilities/widgets/circular_button.dart';
import 'package:music_app/src/utilities/widgets/lazy_loading_text.dart';

import '../string.dart';

part 'dialog_state.dart';
part 'dialog_widget.dart';

class DialogService extends Cubit<DialogState> {
  DialogService._() : super(_InitialDialogState());
  static final DialogService instance = DialogService._();

  Widget get widget => const _Dialog();

  void showDialog({
    required String message,
    Color? textColor,
    bool autoHide = true,
    VoidCallback? onConfirmTap,
    VoidCallback? onCancel,
    bool showActions = false,
    String? icon,
    double? iconSize,
    Color? backgroundColor,
    Color? iconColor,
    Color? iconBackGroundColor,
    Duration duration = const Duration(seconds: 5),
  }) {
    hideDialog();
    emit(
      _ShowDialogState(
        message: message,
        textColor: textColor,
        onConfirmTap: onConfirmTap,
        onCancel: onCancel,
        showActions: showActions,
        iconSize: iconSize,
        backgroundColor: backgroundColor,
        icon: icon,
        iconBackGroundColor: iconBackGroundColor,
        iconColor: iconColor,
      ),
    );

    Future<void>.delayed(duration, () {
      if (autoHide) hideDialog();
    });
  }

  void hideDialog() => emit(_InitialDialogState());
}
