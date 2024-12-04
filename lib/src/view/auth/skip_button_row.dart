part of 'auth_screen.dart';

class _SkipButtonRow extends StatelessWidget {
  const _SkipButtonRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Navigation.appPage,
              (_) => false,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorPallet.lightGrey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: ColorPallet.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
