import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_event.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final formStatus = context.select(
      (ResetPasswordBloc bloc) => bloc.state.formStatus,
    );
    final child = formStatus == FormStatus.loading
        ? const CommonProgressIndicator(scale: 0.8)
        : Text(
            S.of(context).resetPassword,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          );
    return CommonButton(
      width: MediaQuery.of(context).size.width,
      onPressed: () => context.read<ResetPasswordBloc>().add(
        EmailLetterSendEvent(),
      ),
      child: child,
    );
  }
}
