import 'package:flutter/cupertino.dart';

import '/screens/login_success_screen.dart';
import '/screens/signin/signin_screen.dart';
import '/screens/info_splash/info_splash_screen.dart';
import '/screens/home/home_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/signup/signup_screen.dart';

var routes = <String, WidgetBuilder>{
  InfoSplashScreen.screenId: (ctx) => InfoSplashScreen(),
  SignInScreen.screenId: (ctx) => SignInScreen(),
  LoginSuccessScreen.screenId: (ctx) => LoginSuccessScreen(),
  SignUpScreen.screenId: (ctx) => SignUpScreen(),
  SplashScreen.screenId: (ctx) => SplashScreen(),
  HomeScreen.screenId: (ctx) => HomeScreen(),
  ForgotPasswordScreen.screenId: (ctx) => ForgotPasswordScreen(),
};
