import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';

class ProfilePhoneNumberTextField extends StatelessWidget {
  const ProfilePhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumberError = context.select(
      (EditProfileBloc bloc) => bloc.state.phoneNumberError,
    );
    return CommonTextField(
      onChanged: (phoneNumber) {
        context.read<EditProfileBloc>().add(
          ProfilePhoneNumberChangeEvent(phoneNumber),
        );
      },
      prefixIcon: Iconsax.call,
      hintText: 'Enter your phone number',
      errorText: phoneNumberError,
    );
  }
}
