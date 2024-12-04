part of 'home_screen.dart';

class HomeSongList extends StatelessWidget {
  const HomeSongList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = [
      {
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3REKvuZxxdmL9sVcWbLNqJEllWQ_Z58vKBw&s',
        'songName': 'Bad Guy',
        'artistName': 'Billie Eilish',
      },
      {
        'imageUrl':
            'https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png',
        'songName': 'Shape of You',
        'artistName': 'Ed Sheeran',
      },
      {
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLWNyYhqwZI2VyHi13_vlOFV3uVSgXsKHBRg&s',
        'songName': 'Blinding Lights',
        'artistName': 'The Weeknd',
      },
      // Add more songs as needed
    ];

    return Container(
      height: 248.toScale,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // Adjusted borderRadius
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return MusicCard(
            imageUrl: song['imageUrl']!,
            songName: song['songName']!,
            artistName: song['artistName']!,
          );
        },
      ),
    );
  }
}
