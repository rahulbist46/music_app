import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/widgets/albam_card.dart';
import 'package:music_app/src/utilities/widgets/logo.dart';

part 'home_top_row.dart';
part 'home_category.dart';
part 'home_song_list.dart'; // Importing the HomeSongList part

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: Scale.screenHeight * 0.03),
              const HomeTopRow(),
              SizedBox(height: Scale.screenHeight * 0.03),
              const HorizontenCard(),
              SizedBox(height: Scale.screenHeight * 0.03),
              const HomeCategory(),
              SizedBox(height: Scale.screenHeight * 0.03),
              const HomeSongList() // Displaying the HomeSongList widget
            ],
          ),
        ),
      ),
    );
  }
}
