import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';

class ProfilePhoneNumberTextField extends StatelessWidget {
  const ProfilePhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonTextField(
      prefixIcon: Iconsax.call,
      hintText: 'Enter your phone number',
    );
  }
}
