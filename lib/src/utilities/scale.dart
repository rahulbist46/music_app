import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/keys.dart';

class Scale {
  Scale._();
  static final Scale _instance = Scale._();
  factory Scale() => _instance;

  late double _scale;
  late MediaQueryData _media;

  static void initialize() {
    final Scale scale = Scale();
    scale._media = MediaQuery.of(Keys.navigatorKey.currentContext!);

    scale._scale = scale._media.size.height / scale._media.size.width;
  }

  static double get screenHeight => Scale()._media.size.height;
  static double get screenWidht => Scale()._media.size.width;
}

extension ScaleFactor on num {
  double get toScale {
    // if (kIsWeb) {
    //   return this * Scale()._scale * 0.5;
    // } else {
    return this * Scale()._scale * 0.45;
    // }
  }
}
