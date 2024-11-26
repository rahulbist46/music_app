import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/services/cubit/onBoardCubit.dart';
import 'package:music_app/src/utilities/pref_keys.dart';
import 'package:music_app/src/services/storage_service.dart';
import 'package:music_app/src/view/auth/auth_screen.dart';
import 'package:music_app/src/view/splash/splash_screen.dart';

class Navigation extends NavigatorObserver {
  static List<Route<dynamic>> routeStack = <Route<dynamic>>[];

  static const String splashScreen = "/";
  static const String onBoardingScreen = '/on-boarding';
  static const String authScreen = '/AuthScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);
      case authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ),
            settings: settings);
    }
  }

  static String getInitialRoute() {
    final isOnBoardingCompleted = StorageService.instance.readBool(
      PrefKeys.onBoardingCompleted,
    );
    if (!isOnBoardingCompleted) {
      return onBoardingScreen;
    }
    // if (StorageService.instance.isLoggedIn) {
    return splashScreen;
    // }
    // return authScreen;
  }

  List<BlocProvider<dynamic>> _getBlocs(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return <BlocProvider<dynamic>>[
          BlocProvider<OnBoardingCubit>(
            create: (BuildContext context) => OnBoardingCubit(),
          ),
        ];

      default:
        return <BlocProvider<dynamic>>[];
    }
  }
}
