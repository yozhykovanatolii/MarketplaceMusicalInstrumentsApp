import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/register/widget/register_email_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/register/widget/register_full_name_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/register/widget/register_password_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/register/widget/register_phone_number_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/register/widget/sign_up_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.failure) {
            SnackBarUtil.showSnackBar(
              context,
              state.errorMessage,
              Icons.error,
              0xFFFFEEEF,
              0xFFE77282,
            );
          }
          if (state.formStatus == FormStatus.success) {
            SnackBarUtil.showSnackBar(
              context,
              'Success registration',
              Icons.check_circle,
              0xFFD4FFFE,
              0xFF009688,
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
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill your information below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 50),
                const RegisterFullNameTextField(),
                const SizedBox(height: 15),
                const RegisterEmailTextField(),
                const SizedBox(height: 15),
                const RegisterPasswordTextField(),
                const SizedBox(height: 15),
                const RegisterPhoneNumberTextField(),
                const SizedBox(height: 30),
                const SignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
