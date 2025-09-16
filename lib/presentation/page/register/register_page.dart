import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Fill your information below',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 50),
              const CommonTextField(
                prefixIcon: Icons.person,
                hintText: 'Enter your full name',
              ),
              const SizedBox(height: 15),
              const CommonTextField(
                prefixIcon: Icons.email,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 15),
              const CommonTextField(
                prefixIcon: Icons.lock,
                hintText: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(height: 30),
              CommonButton(
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
