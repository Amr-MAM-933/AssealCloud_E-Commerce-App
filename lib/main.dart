import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routes.dart';
import 'theme.dart';
import '/screens/splash_screen.dart';
import 'api/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setHomeScreen();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asseal Cloud',
      theme: theme,
      routes: routes,
      initialRoute: SplashScreen.screenId,
    );
  }
}
