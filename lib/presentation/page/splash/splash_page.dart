import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.blue,
      childWidget: const Icon(
        size: 100,
        Icons.store,
        color: Colors.white,
      ),
      nextScreen: const LoginPage(),
    );
  }
}
