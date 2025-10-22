import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/home/widget/notification_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rentify',
          style: GoogleFonts.pacifico(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        const NotificationButton(),
      ],
    );
  }
}
