import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';

class ThemeService extends Cubit<ThemeMode> {
  ThemeService._() : super(ThemeMode.light);

  static final ThemeService instance = ThemeService._();

  static final DarkPallet _darkPallet = DarkPallet();

  static final ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: _darkPallet.primaryColor,
      scaffoldBackgroundColor: _darkPallet.scaffoldColor,
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: ColorPallet.grey,
          cursorColor: ColorPallet.white,
          selectionHandleColor: ColorPallet.white),
      colorScheme: ColorScheme.dark(
          primary: _darkPallet.primaryColor,
          secondary: _darkPallet.accentColor),
      textTheme: _textTheme,
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }));

  static final LightPallet _lightPallet = LightPallet();
  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: _lightPallet.primaryColor,
      scaffoldBackgroundColor: _lightPallet.scaffoldColor,
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: ColorPallet.grey,
          cursorColor: ColorPallet.white,
          selectionHandleColor: ColorPallet.white),
      colorScheme: ColorScheme.light(
          primary: _darkPallet.primaryColor,
          secondary: _darkPallet.accentColor),
      textTheme: _textTheme,
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }));

  static const TextTheme _textTheme = TextTheme(
    displayLarge: headline1,
    displayMedium: headline2,
    displaySmall: headline3,
    headlineMedium: headline4,
    headlineSmall: headline5,
    titleLarge: headline6,
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
  );

  void changeThemeMode() {
    if (isDark) {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.dark);
    }
  }

  bool get isDark => state == ThemeMode.dark;

  static const TextStyle headline1 = TextStyle(
    fontSize: 33,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 30,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: 27,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle headline4 = TextStyle(
    fontSize: 24,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle headline5 = TextStyle(
    fontSize: 21,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle headline6 = TextStyle(
    fontSize: 18,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 14,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 12,
    color: ColorPallet.black,
    fontFamily: 'DMSans',
  );

  static final TextStyle boldBlack = headline5.copyWith(
    color: ColorPallet.black2,
    fontWeight: FontWeight.w800,
    fontFamily: 'DMSans',
  );

  static final TextStyle titleStyle = headline5.copyWith(
    fontWeight: FontWeight.w500,
    wordSpacing: 3,
    height: 1.5,
  );

  static final TextStyle subTitleStyle = bodyText1.copyWith(
    wordSpacing: 2,
    height: 1.5,
    color: ColorPallet.mediumGrey,
  );
}
