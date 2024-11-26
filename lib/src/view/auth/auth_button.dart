part of 'auth_screen.dart';

class _AuthButton extends StatefulWidget {
  const _AuthButton();

  @override
  State<_AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<_AuthButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsSignUpCubit, bool>(
      builder: (BuildContext context, bool isSignUp) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Button(
              onTap: () {
                // if (isSignUp) {
                //   authBloc.add(AuthSendOtp());
                // } else {
                //   authBloc.add(AuthLogin());
                // }
              },
              width: Scale.screenWidht,
              height: 60.toScale,
              // isLoading: state is AuthLoading,
              text: isSignUp ? Strings.signUp : Strings.login,
              textStyle: ThemeService.headline6.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPallet.white,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: Scale.screenHeight * 0.01),
            SizedBox(height: Scale.screenHeight * 0.02),

            // SizedBox(height: Scale.screenHeight * 0.012),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamedAndRemoveUntil(
            //       context,
            //       Navigation.appPage,
            //       (_) => false,
            //     );
            //   },
            //   child: Text(
            //     Strings.continueWithoutLogin,
            //     style: ThemeService.bodyText2.copyWith(
            //       fontWeight: FontWeight.w600,
            //       decoration: TextDecoration.underline,
            //     ),
            //   ),
            // ),
            // SizedBox(height: Scale.screenHeight * 0.02)
          ],
        );
      },
    );
  }
}
