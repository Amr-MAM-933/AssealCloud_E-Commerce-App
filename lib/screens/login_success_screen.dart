import 'package:flutter/material.dart';

import '/screen_size.dart';
import '/widgets/main_button.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);
  static const screenId = '/LoginSuccessScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Column(
        children: [
          // SizedBox(height: ScreenSize.screenHeight! * 0.08),
          Spacer(),
          Image.asset(
            'assets/images/amsuccess.png',
            height: ScreenSize.screenHeight! * 0.4,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          // SizedBox(height: ScreenSize.screenHeight! * 0.08),
          Spacer(),
          SizedBox(
            width: ScreenSize.screenWidth! * 0.8,
            child: MainButton(
              child: Text("Back to home"),
              onTap: () {},
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
