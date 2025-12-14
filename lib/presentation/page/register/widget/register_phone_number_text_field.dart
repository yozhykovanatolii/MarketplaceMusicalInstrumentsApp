import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/core/localization/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

class RegisterPhoneNumberTextField extends StatelessWidget {
  const RegisterPhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterCubit, RegisterState, String?>(
      selector: (state) => state.phoneNumberError,
      builder: (context, phoneNumberError) {
        return CommonTextField(
          onChanged: (phoneNumber) =>
              context.read<RegisterCubit>().setRegisterPhoneNumber(phoneNumber),
          hintText: S.of(context).enterYourPhoneNumber,
          errorText: phoneNumberError,
        );
      },
    );
  }
}
