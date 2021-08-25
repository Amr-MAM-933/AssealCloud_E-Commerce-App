import 'package:flutter/material.dart';

import '/theme.dart';
import './widgets/forgot_password_form.dart';
import '/screen_size.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const screenId = '/ForgotPasswordScreen';

  @override
  Widget build(BuildContext context) {
    late final AppBar appBar;
    return Scaffold(
      appBar: appBar = AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: ScreenSize.cleanHeight(appBar: appBar),
            child: Column(
              children: <Widget>[
                Spacer(flex: 4),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  'Please enter your email and we will send/nyou a link to return to your account',
                  textAlign: TextAlign.center,
                ),
                Spacer(
                  flex: 2,
                ),
                ForgotPasswordForm(appBar: appBar),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
