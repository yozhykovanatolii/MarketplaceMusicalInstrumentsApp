import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_cubit.dart';

class ProfilePhoneNumberTextField extends StatelessWidget {
  final TextEditingController? controller;

  const ProfilePhoneNumberTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final phoneNumberError = context.select(
      (EditProfileCubit bloc) => bloc.state.phoneNumberError,
    );
    return CommonTextField(
      controller: controller,
      onChanged: (phoneNumber) {
        context.read<EditProfileCubit>().editUserPhoneNumber(phoneNumber);
      },
      hintText: S.of(context).enterYourPhoneNumber,
      errorText: phoneNumberError,
    );
  }
}
