import 'package:flutter/material.dart';
import 'package:music_app/src/utilities/dialog/dialog_service.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/view/home/home_screen.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with TickerProviderStateMixin {
  @override
  void initState() {
    // Initializing screen scale so that the screen layout can be adjusted according to screen size.
    // This will let us use .toHeight .toWidth .toFont extensions.
    Scale.initialize();
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const HomeScreen(),
            DialogService.instance.widget,
          ],
        ),
      ),
    );
  }
}
