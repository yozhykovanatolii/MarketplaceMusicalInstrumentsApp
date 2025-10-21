import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/forgot_password/widget/forgot_password_email_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/forgot_password/widget/reset_password_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.success) {
            SnackBarUtil.showSnackBar(
              context,
              'The operation was completed successfully. Check your email.',
              Icons.check_circle,
              0xFFD4FFFE,
              0xFF009688,
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          }
          if (state.formStatus == FormStatus.failure) {
            SnackBarUtil.showSnackBar(
              context,
              state.errorMessage,
              Icons.error,
              0xFFFFEEEF,
              0xFFE77282,
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your email address and we will send you a link to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 50),
                const ForgotPasswordEmailTextField(),
                const SizedBox(height: 30),
                const ResetPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
