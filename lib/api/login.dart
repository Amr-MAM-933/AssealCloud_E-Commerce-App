import '/screens/home/home_screen.dart';
import '/screens/info_splash/info_splash_screen.dart';

import './models/user.dart';
import '/main_providers.dart';
import './mainServices.dart';

//-------- DUMMY API FUNCTIONS TO MAINTAIN UI--------

Future<Response> login(String username, String password) {
  return Future.delayed(Duration.zero).then((value) => Response());
}

User? get getLoggedUser => null; //User();

void setHomeScreen() {
  if (getLoggedUser == null) {
    homeIdProvider.data = InfoSplashScreen.screenId;
  } else {
    homeIdProvider.data = HomeScreen.screenId;
  }
}
