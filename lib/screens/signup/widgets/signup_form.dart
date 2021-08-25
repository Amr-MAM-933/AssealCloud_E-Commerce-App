import 'package:flutter/material.dart';

import '/constants.dart';
import '/screen_size.dart';
import '/widgets/custom_suffix_icon.dart';
import '/widgets/main_button.dart';
import '/widgets/social_card.dart';
import '/screens/complete_profile/complete_profile_screen.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPassword = '';
  bool firstSubmit = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: ScreenSize.cleanHeight(appBar: appBar) * 0.8,
        child: Column(
          children: <Widget>[
            Spacer(flex: 4),
            buildEmailFormField(),
            SizedBox(height: 20),
            buildPasswordFormField(),
            SizedBox(height: 20),
            buildConfirmPasswordFormField(),
            Spacer(flex: 1), //(height: 50),
            Spacer(flex: 1),
            MainButton(
                child: Text('Continue'),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.screenId);
                  }
                  firstSubmit = false;
                }),
            Spacer(flex: 3),
            buildSocialCards(),
            Spacer(flex: 1),
            Text(
              "By continuing you confirm that you agree\nwith our terms and conditions",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newEmail) => email = newEmail ?? '',
      controller: TextEditingController(text: email),
      onChanged: (email) {
        if (!firstSubmit) {
          _formKey.currentState!.save();
          _formKey.currentState!.validate();
        }
      },
      validator: (val) {
        final email = val ?? '';
        if (email.isEmpty) {
          return FormErrors.kEmailNullError;
        } else if (email.isNotEmpty &&
            !FormErrors.emailValidatorRegExp.hasMatch(email)) {
          return FormErrors.kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/Mail.svg"),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newPassword) => password = newPassword ?? '',
      onChanged: (pass) {
        if (!firstSubmit) {
          _formKey.currentState!.save();
          _formKey.currentState!.validate();
        }
      },
      validator: (val) {
        final password = val ?? '';
        if (password.isEmpty) {
          return FormErrors.kPassNullError;
        } else if (password.isNotEmpty && password.length <= 7) {
          return FormErrors.kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/Lock.svg"),
      ),
      obscureText: true,
    );
  }

  Widget buildSocialCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          svgIcon: "assets/icons/google-icon.svg",
          onTap: () {},
        ),
        SocialCard(
          svgIcon: "assets/icons/facebook-2.svg",
          onTap: () {},
        ),
        SocialCard(
          svgIcon: "assets/icons/twitter.svg",
          onTap: () {},
        ),
      ],
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      onSaved: (newPassword) => confirmPassword = newPassword ?? '',
      onChanged: (pass) {
        confirmPassword = pass;
        if (!firstSubmit) {
          _formKey.currentState!.save();
          _formKey.currentState!.validate();
        }
      },
      validator: (pass) {
        if (pass != password) {
          return FormErrors.kMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Repeat your password",
        suffixIcon: customSuffixIcon(iconPath: "assets/icons/Lock.svg"),
      ),
      obscureText: true,
    );
  }
}
