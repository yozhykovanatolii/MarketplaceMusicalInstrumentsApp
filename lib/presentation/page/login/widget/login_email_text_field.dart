import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, String?>(
      selector: (state) => state.emailError,
      builder: (context, emailError) {
        return CommonTextField(
          onChanged: (email) => context.read<LoginBloc>().add(
            LoginEmailChangeEvent(email),
          ),
          hintText: 'Enter your email',
          errorText: emailError,
        );
      },
    );
  }
}
