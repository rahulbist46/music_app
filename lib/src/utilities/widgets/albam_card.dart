import 'package:flutter/material.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/assets.dart';

class HorizontenCard extends StatelessWidget {
  const HorizontenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Positioned image to appear outside container
          const Positioned(
            right: -30,
            top: -20,
            child: Image(
              image: AssetImage(Assets.homeArtist),
              fit: BoxFit.cover,
              height: 140,
            ),
          ),
          // Text content
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New Album',
                    style: ThemeService.bodyText1.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Happier Than Ever',
                    style: ThemeService.bodyText1.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Billie Eilish',
                    style: ThemeService.bodyText1.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  final String imageUrl;
  final String songName;
  final String artistName;

  const MusicCard({
    super.key,
    required this.imageUrl,
    required this.songName,
    required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with overlay play button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Song Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                songName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Artist Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                artistName,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
