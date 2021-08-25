import 'package:flutter/material.dart';

import '/theme.dart';
import 'widgets/complete_profile_form.dart';
import '/screen_size.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);
  static const screenId = '/CompleteProfileScreen';

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
                Spacer(flex: 4),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Complete Profile',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Text(
                  'Complete your profile details',
                  textAlign: TextAlign.center,
                ),
                CompleteProfileForm(appBar: appBar),
                Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
