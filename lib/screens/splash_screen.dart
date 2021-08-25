import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';

import '/theme.dart';
import '/main_providers.dart';

final _animationProvider = AmDataProvider<double>(initialData: 0);

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const screenId = '/SplashScreen';
  final String assetImage = 'assets/logo.png';

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (_) {
        _animationProvider.data = 150;
        Future.delayed(Duration(seconds: 3)).then((_) {
          Navigator.pushReplacementNamed(context, homeIdProvider.data!);
        });
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AmRefreshWidget(
                amDataProvider: _animationProvider,
                builder: (ctx, value) => AnimatedContainer(
                  curve: Curves.elasticOut,
                  height: _animationProvider.data!,
                  width: double.infinity,
                  duration: Duration(seconds: 2),
                  child: Image.asset(assetImage, fit: BoxFit.fill),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
