import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';

import '/screen_size.dart';
import '/screens/info_splash/widgets/splash_content.dart';
import '/screens/info_splash/widgets/dot_bar.dart';
import '/widgets/main_button.dart';
import '/screens/signin/signin_screen.dart';

class InfoSplashScreen extends StatelessWidget {
  InfoSplashScreen({Key? key}) : super(key: key);

  static const screenId = '/InfoSplashScreen';
  static final dotBarProvider = AmDataProvider<int>(
    initialData: 0,
    providerId: 'splsh',
  );

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: ScreenSize.cleanHeight(),
            child: Column(
              children: <Widget>[
                Spacer(flex: 2),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
                Spacer(flex: 2),
                Container(
                  height: ScreenSize.cleanHeight() * 0.5,
                  child: splashContent(dotBarProvider: dotBarProvider),
                ),
                Spacer(flex: 1),
                SizedBox(height: ScreenSize.cleanHeight() * 0.02),
                Container(
                  height: ScreenSize.cleanHeight() * 0.02,
                  child: AmRefreshWidget<int>(
                    amDataProvider: dotBarProvider,
                    builder: (ctx, val) => Container(
                      child: DotBar(
                        count: 3,
                        current: val!,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 5),
                MainButton(
                  child: Text('Continue'),
                  onTap: () {
                    Navigator.of(context).pushNamed(SignInScreen.screenId);
                  },
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
