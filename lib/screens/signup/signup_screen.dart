import 'package:flutter/material.dart';

import '/theme.dart';
import 'widgets/signup_form.dart';
import '/screen_size.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const screenId = '/SignUpScreen';

  @override
  Widget build(BuildContext context) {
    late final AppBar appBar;
    return Scaffold(
      appBar: appBar = AppBar(title: Text('SignUp')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Container(
            height: ScreenSize.cleanHeight(appBar: appBar),
            child: Column(
              children: <Widget>[
                Spacer(flex: 2),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register Account',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  'Complete your details or continue\nwith social media',
                  textAlign: TextAlign.center,
                ),
                SignUpForm(appBar: appBar),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
