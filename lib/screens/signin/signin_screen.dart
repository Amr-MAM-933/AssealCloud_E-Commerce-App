import 'package:flutter/material.dart';

import '/theme.dart';
import 'widgets/signin_form.dart';
import '/screen_size.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const screenId = '/SignInScreen';

  @override
  Widget build(BuildContext context) {
    late final AppBar appBar;
    return Scaffold(
      appBar: appBar = AppBar(title: Text('SignIn')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: ScreenSize.cleanHeight(appBar: appBar),
            child: Column(
              children: <Widget>[
                Spacer(flex: 2),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Back',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'SignIn with your email and password \n or continue with social media',
                  textAlign: TextAlign.center,
                ),
                SignInForm(appBar: appBar),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
