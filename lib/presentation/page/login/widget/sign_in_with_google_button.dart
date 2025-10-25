import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      width: MediaQuery.of(context).size.width,
      onPressed: () {},
      color: const Color(0xFFF6F6F6),
      child: const Text(
        'Sign In with Google',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
