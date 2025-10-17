import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';

class ProfileFullNameTextField extends StatelessWidget {
  const ProfileFullNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameError = context.select(
      (EditProfileBloc bloc) => bloc.state.fullNameError,
    );
    return CommonTextField(
      onChanged: (fullName) {
        context.read<EditProfileBloc>().add(
          ProfileFullNameChangeEvent(fullName),
        );
      },
      prefixIcon: Icons.person,
      hintText: 'Enter your full name',
      errorText: fullNameError,
    );
  }
}
