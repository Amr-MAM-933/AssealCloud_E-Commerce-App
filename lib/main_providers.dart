import 'package:am_state/am_state.dart';
import '/screens/info_splash/info_splash_screen.dart';

final homeIdProvider = AmDataProvider<String>(
  initialData: InfoSplashScreen.screenId,
  providerId: 'homeIdProvider',
);
