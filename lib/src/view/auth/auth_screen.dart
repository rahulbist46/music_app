import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/services/cubit/is_sign_up_cubit.dart';
import 'package:music_app/src/services/cubit/password_fields_cubit.dart';
import 'package:music_app/src/services/cubit/theme_service.dart';
import 'package:music_app/src/utilities/scale.dart';
import 'package:music_app/src/utilities/string.dart';
import 'package:music_app/src/utilities/theme/theme_colors.dart';
import 'package:music_app/src/utilities/widgets/button.dart';
import 'package:music_app/src/utilities/widgets/custom_text_feilds.dart';
import 'package:music_app/src/utilities/widgets/normal_and_bold.dart';
import 'package:music_app/src/view/auth/auth_top_row.dart';

part 'additional_sign_up_details.dart';
part 'auth_button.dart';
part 'email_and_password.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  // late AnimationController animation;
  double distanceBetweenButtonAndTexField = Scale.screenHeight * 0.18;

  // @override
  // void initState() {
  //   authBloc = context.read<AuthBloc>();
  //   authBloc.emailFocusNode.addListener(_focusNodeListener);
  //   authBloc.passwordFocusNode.addListener(_focusNodeListener);

  //   // animation = AnimationController(
  //   //   vsync: this,
  //   //   duration: const Duration(milliseconds: 700),
  //   // );

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BlocConsumer<IsSignUpCubit, bool>(
              listener: (BuildContext context, bool isSignUp) {
                //   if (isSignUp) {
                //     // animation.forward();
                //     authBloc.emailFocusNode.unfocus();
                //     authBloc.passwordFocusNode.unfocus();
                //   }
              },
              builder: (BuildContext context, bool isSignUp) {
                return Form(
                  // key: authBloc.formKey,
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior(),
                    child: ListView(
                      padding: EdgeInsets.all(16.toScale),
                      children: [
                        SizedBox(height: Scale.screenHeight * 0.01),
                        // const _SkipButtonRow(),
                        const AuthTopRow(),
                        SizedBox(height: Scale.screenHeight * 0.04),
                        // const LogoWithName(),
                        SizedBox(height: Scale.screenHeight * 0.04),
                        NormalAndBoldText(
                          normalText: isSignUp ? 'Create an ' : 'Login ',
                          boldText: isSignUp ? 'Account!' : '',
                          normalStyle: ThemeService.headline4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Scale.screenHeight * 0.005),
                        // Text(
                        //   isSignUp
                        //       ? Strings.signUpSubtitle
                        //       : Strings.signInSubtitle,
                        //   style: ThemeService.bodyText1,
                        // ),
                        SizedBox(height: Scale.screenHeight * 0.02),
                        if (isSignUp) const _AdditionalSignUpDetails(),
                        // FadeTransition(
                        //   opacity: animation,
                        //   child: const _AdditionalSignUpDetails(),
                        // ),
                        SizedBox(height: Scale.screenHeight * 0.015),
                        const _EmailAndPassword(),
                        if (!isSignUp) ...<Widget>[
                          SizedBox(height: Scale.screenHeight * 0.01),
                          // const _ForgotPasswordButton(),
                        ],
                        SizedBox(height: Scale.screenHeight * 0.04),
                        const _AuthButton(),
                        // SizedBox(height: Scale.screenHeight * 0.02),
                        // const OrDivider(),
                        // SizedBox(height: Scale.screenHeight * 0.03),
                        // const GoogleSignInButton(),
                        // SizedBox(height: Scale.screenHeight * 0.02),
                        // Center(
                        //   child: NormalAndBoldText(
                        //     normalText: isSignUp
                        //         ? Strings.alreadyHaveAnAccount
                        //         : Strings.dontHaveAnAccount,
                        //     normalStyle: ThemeService.bodyText1,
                        //     boldText:
                        //         isSignUp ? Strings.login : Strings.signUp,
                        //     boldStyle: ThemeService.bodyText1.copyWith(
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //     onBoldTap: () {
                        //       context.read<IsSignUpCubit>().change();
                        //       authBloc.clear();
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // DialogService.instance.widget,
          ],
        ),
      ),
    );
  }

//   void _focusNodeListener() {
//     if (authBloc.emailFocusNode.hasFocus ||
//         authBloc.passwordFocusNode.hasFocus) {
//       distanceBetweenButtonAndTexField = Scale.screenHeight * 0.04;
//     } else {
//       distanceBetweenButtonAndTexField = Scale.screenHeight * 0.218;
//     }
//     if (mounted) setState(() {});
//   }

//   void _authListener(BuildContext context, AuthState state) {
//     if (state is AuthError) {
//       DialogService.instance.showDialog(
//         message: state.error.serverMessage ?? state.error.errorMessage,
//         icon: Assets.warning,
//         iconColor: ColorPallet.white,
//         iconBackGroundColor: ColorPallet.red,
//       );
//     } else if (state is AuthOtpSent) {
//       Navigator.pushNamed(context, Navigation.otpScreen);
//     } else if (state is AuthForgotPasswordOtpVerified) {
//       Navigator.popAndPushNamed(context, Navigation.resetPasswordScreen);
//     } else if (state is AuthChangePasswordSuccessful) {
//       DialogService.instance.showDialog(
//         message: "Password Changed Successfully",
//         icon: Assets.check,
//         iconColor: ColorPallet.black,
//         // iconBackGroundColor: ColorPallet.red,
//       );
//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         Navigation.authScreen,
//         (Route<dynamic> route) => false,
//       );
//     } else if (state is AuthSuccessful) {
//       context.read<AuthBloc>().clear();
//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         Navigation.appPage,
//         (Route<dynamic> route) => false,
//       );
//     }
//   }
// }
}
