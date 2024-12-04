part of 'home_screen.dart';

class HomeTopRow extends StatelessWidget {
  const HomeTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(FluentIcons.search_16_regular),
        Spacer(),
        Logo(
          scale: 1.5,
        ),
        Spacer(),
        Icon(FluentIcons.more_horizontal_16_regular),
      ],
    );
  }
}
