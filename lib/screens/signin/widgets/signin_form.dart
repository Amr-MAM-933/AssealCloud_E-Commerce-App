import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';

import '/constants.dart';
import '/screen_size.dart';
import '/screens/login_success_screen.dart';
import '/theme.dart';
import '/widgets/custom_suffix_icon.dart';
import '/widgets/main_button.dart';
import '/widgets/no_account_widget.dart';
import '/widgets/social_card.dart';
import '/screens/forgot_password/forgot_password_screen.dart';

class SignInForm extends StatelessWidget {
  SignInForm({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
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
            Spacer(flex: 1), //(height: 50),
            buildRememberMeForgotPassword(context),
            Spacer(flex: 1),
            MainButton(
                child: Text('SignIn'),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, LoginSuccessScreen.screenId);
                  }
                  firstSubmit = false;
                }),
            Spacer(flex: 3),
            buildSocialCards(),
            Spacer(flex: 1),
            NoAccountWidget(),
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
      onChanged: (password) {
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

  Widget buildRememberMeForgotPassword(BuildContext ctx) {
    final rememberMe = AmDataProvider<bool>(
      initialData: false,
      providerId: 'rememberMe',
    );
    return Row(
      children: [
        AmRefreshWidget<bool>(
          amDataProvider: rememberMe,
          builder: (ctx, val) => Checkbox(
            value: val,
            activeColor: theme.primaryColor,
            onChanged: (value) => rememberMe.data = value,
          ),
        ),
        Text("Remember me"),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pushNamed(ForgotPasswordScreen.screenId);
          },
          child: Text(
            "Forgot password",
          ),
        ),
      ],
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
}
