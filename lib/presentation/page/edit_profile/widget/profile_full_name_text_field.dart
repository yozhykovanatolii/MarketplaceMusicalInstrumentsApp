import 'package:flutter/material.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';

class ProfileFullNameTextField extends StatelessWidget {
  const ProfileFullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonTextField(
      prefixIcon: Icons.person,
      hintText: 'Enter your full name',
    );
  }
}
