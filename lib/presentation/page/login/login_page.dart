import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hi! Welcome back, you\'ve been missed',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 50),
              const CommonTextField(
                prefixIcon: Icons.email,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 15),
              const CommonTextField(
                prefixIcon: Icons.lock,
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 30),
              CommonButton(
                onPressed: () {},
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Or sign in with',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 15),
              CommonButton(
                onPressed: () {},
                color: Colors.white,
                child: const Text(
                  'Sign In with Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                  children: [
                    const WidgetSpan(
                      child: SizedBox(width: 5),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Hello, world');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
