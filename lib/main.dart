import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/observer.dart';
import 'package:music_app/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Populating all the necessary requirements of the app. Like: currency, base URL, app version, buildNumber, and all.
  // Note that this should be done at the start because the rest of the services depend on this.

  // await AppInfoService.instance.initialize();

  // Initializing dio and adding interceptors.
  // [Note: This is done before repo initialization because we need to initialize each and every repo clients.]
  // Initializing ApiClient [Dio], This will also add interceptors.

  // ApiClient.instance.initialize();

  // Passing all the repos that are going to be used in the app

  Bloc.observer = Observer();
  // Then we setup preferred orientations,
  // and only after it finishes we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const App()));
}
