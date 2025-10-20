import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_event.dart';

class ForgotPasswordEmailTextField extends StatelessWidget {
  const ForgotPasswordEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final emailErrorMessage = context.select(
      (ResetPasswordBloc bloc) => bloc.state.emailErrorMessage,
    );
    return CommonTextField(
      onChanged: (email) => context.read<ResetPasswordBloc>().add(
        UserEmailChangeEvent(email),
      ),
      prefixIcon: Iconsax.directbox_default,
      hintText: 'Enter your email',
      errorText: emailErrorMessage,
    );
  }
}
