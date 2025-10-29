import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      width: MediaQuery.of(context).size.width,
      onPressed: () {},
      color: const Color(0xFFF6F6F6),
      child: Text(
        S.of(context).signInWithGoogle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
