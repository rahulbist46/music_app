part of 'home_screen.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> musicCategories = [
      {'title': 'Trending Songs'},
      {'title': 'New Releases'},
      {'title': 'Top Playlists'},
      {'title': 'Artists You Love'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Music Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 50, // Set height for horizontal scrolling
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: musicCategories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('Selected: ${musicCategories[index]['title']}');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        musicCategories[index]['title']!,
                        style: ThemeService.bodyText1.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
