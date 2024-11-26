part of 'auth_screen.dart';

class _EmailAndPassword extends StatefulWidget {
  const _EmailAndPassword();

  @override
  State<_EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<_EmailAndPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // We are adding another form just because forgot password need a AuthBloc validation.
        // And that will only be done on phone number textfield
        Form(
          // key: authBloc.phoneFormKey,
          child: CustomTextField(
            controller: emailController,
            prefixIcon: FluentIcons.mail_16_regular,
            hintText: Strings.email,
            keyboardType: TextInputType.emailAddress,
            // enabled: state is! AuthLoading,
            // focusNode: authBloc.emailFocusNode,
            autofocus: !context.watch<IsSignUpCubit>().state,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return Strings.emailValidator;
              }
              // if (!value.isValidEmail()) {
              //   return Strings.invalidEmailValidator;
              // }
              return null;
            },
          ),
        ),
        // previous 0.1
        SizedBox(height: Scale.screenHeight * 0.025),
        BlocBuilder<PasswordFieldsCubit, bool>(
          builder: (context, obscureText) {
            return CustomTextField(
              controller: passwordController,
              prefixIcon: FluentIcons.lock_closed_16_regular,
              hintText: Strings.password,
              obsecure: obscureText,
              // enabled: state is! AuthLoading,
              // focusNode: authBloc.passwordFocusNode,
              validationText: Strings.passwordValidator,
              suffix: IconButton(
                icon: Icon(
                  obscureText
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                ),
                onPressed: () {
                  context.read<PasswordFieldsCubit>().change();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
