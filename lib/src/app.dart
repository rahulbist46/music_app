import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/services/cubit/is_sign_up_cubit.dart';
import 'package:music_app/src/services/cubit/password_fields_cubit.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/keys.dart';
import 'package:music_app/src/utilities/navigation.dart';
import 'package:music_app/src/utilities/string.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  @override
  void initState() {
    // Initializing screen scale so that the screen layout can be adjusted according to screen size.
    // This will let us use .toHeight .toWidth .toFont extensions.
    // Scale.initialize();
    // RemoteConfigService.instance.initialize();

    // We only want to check for permission if user is logged in
    // We can only do this once storage service is initialized
    // if (StorageService.instance.isLoggedIn) {
    // NotificationBloc.instance.checkPermission();
    // Subscribing to notifications
    // NotificationBloc.instance.subscribeToTopics();
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ThemeService>(
          create: (BuildContext context) => ThemeService.instance,
        ),
        BlocProvider<IsSignUpCubit>(
          create: (BuildContext context) => IsSignUpCubit(),
        ),
        BlocProvider<PasswordFieldsCubit>(
          create: (BuildContext context) => PasswordFieldsCubit(),
        ),
      ],
      child: BlocBuilder<ThemeService, ThemeMode>(
        builder: (BuildContext context, ThemeMode state) {
          return GestureDetector(
            onTap: () {},
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              theme: ThemeService.light,
              darkTheme: ThemeService.dark,
              themeMode: state,
              navigatorObservers: <NavigatorObserver>[Navigation()],
              navigatorKey: Keys.navigatorKey,
              onGenerateRoute: Navigation.generateRoute,
              initialRoute: Navigation.splashScreen,
            ),
          );
        },
      ),
    );
  }
}
