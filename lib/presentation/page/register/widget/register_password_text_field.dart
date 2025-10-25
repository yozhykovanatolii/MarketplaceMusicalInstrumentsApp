import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

class RegisterPasswordTextField extends StatelessWidget {
  const RegisterPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, String?>(
      selector: (state) => state.passwordError,
      builder: (context, passwordError) {
        return CommonTextField(
          onChanged: (password) => context.read<RegisterBloc>().add(
            RegisterPasswordChangeEvent(password),
          ),
          hintText: 'Enter your password',
          obscureText: true,
          errorText: passwordError,
        );
      },
    );
  }
}
