import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginBloc, LoginState, String?>(
      selector: (state) => state.passwordError,
      builder: (context, passwordError) {
        return CommonTextField(
          onChanged: (password) => context.read<LoginBloc>().add(
            LoginPasswordChangeEvent(password),
          ),
          hintText: S.of(context).enterYourPassword,
          errorText: passwordError,
          obscureText: true,
        );
      },
    );
  }
}
