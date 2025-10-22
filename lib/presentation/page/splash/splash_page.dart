import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/login_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((AppBloc appBloc) => appBloc.state);
    final nextScreen = state is UserAuthenticatedState
        ? const MainPage()
        : const LoginPage();
    return FlutterSplashScreen.fadeIn(
      backgroundColor: const Color(0xFF007DFC),
      animationDuration: const Duration(milliseconds: 3000),
      childWidget: Text(
        'Rentify',
        style: GoogleFonts.pacifico(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.w600,
        ),
      ),
      nextScreen: nextScreen,
    );
  }
}
