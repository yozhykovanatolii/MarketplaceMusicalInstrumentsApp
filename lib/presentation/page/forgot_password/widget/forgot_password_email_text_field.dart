import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_cubit.dart';

class ForgotPasswordEmailTextField extends StatelessWidget {
  const ForgotPasswordEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailErrorMessage = context.select(
      (ResetPasswordCubit bloc) => bloc.state.emailErrorMessage,
    );
    return CommonTextField(
      onChanged: (email) =>
          context.read<ResetPasswordCubit>().changeUserEmail(email),
      hintText: S.of(context).enterYourEmail,
      errorText: emailErrorMessage,
    );
  }
}
