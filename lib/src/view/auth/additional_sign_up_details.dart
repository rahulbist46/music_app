part of 'auth_screen.dart';

class _AdditionalSignUpDetails extends StatefulWidget {
  const _AdditionalSignUpDetails();

  @override
  State<_AdditionalSignUpDetails> createState() =>
      _AdditionalSignUpDetailsState();
}

class _AdditionalSignUpDetailsState extends State<_AdditionalSignUpDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: name,
          prefixIcon: FluentIcons.person_16_regular,
          hintText: Strings.fullName,
          validationText: Strings.nameValidator,
        ),
        SizedBox(
          height: Scale.screenHeight * 0.025,
        ),
        CustomTextField(
          controller: phoneNumber,
          prefixIcon: FluentIcons.call_16_regular,
          maxLength: 10,
          digitsOnly: true,
          hintText: Strings.phoneNumber,
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return Strings.phoneNumberValidator;
            }
            return null;
          },
        ),
        SizedBox(height: Scale.screenHeight * 0.012),
      ],
    );
  }
}
