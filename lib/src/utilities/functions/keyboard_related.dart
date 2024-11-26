import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/keys.dart';

bool isKeyboardVisible(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom != 0;
}

void hideKeyboard() {
  final BuildContext? context = Keys.navigatorKey.currentContext;
  if (context == null) return;
  if (!isKeyboardVisible(context)) return;
  FocusScope.of(context).unfocus();
}
