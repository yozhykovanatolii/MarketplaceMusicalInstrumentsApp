import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RegisterBloc, RegisterState, FormStatus>(
      selector: (state) => state.formStatus,
      builder: (context, formStatus) {
        final child = formStatus == FormStatus.loading
            ? const CommonProgressIndicator(scale: 0.8)
            : const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              );
        return CommonButton(
          onPressed: () => context.read<RegisterBloc>().add(
            RegisterSubmitEvent(),
          ),
          child: child,
        );
      },
    );
  }
}
