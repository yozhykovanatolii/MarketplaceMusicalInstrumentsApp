import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

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
                const Text(
                  'FullName',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                BlocSelector<RegisterBloc, RegisterState, String?>(
                  selector: (state) => state.fullNameError,
                  builder: (context, fullNameError) {
                    return CommonTextField(
                      onChanged: (fullName) => context.read<RegisterBloc>().add(
                        RegisterFullNameChangeEvent(fullName),
                      ),
                      hintText: 'Enter your full name',
                      errorText: fullNameError,
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                BlocSelector<RegisterBloc, RegisterState, String?>(
                  selector: (state) => state.emailError,
                  builder: (context, emailError) {
                    return CommonTextField(
                      onChanged: (email) => context.read<RegisterBloc>().add(
                        RegisterEmailChangeEvent(email),
                      ),
                      hintText: 'Enter your email',
                      errorText: emailError,
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                BlocSelector<RegisterBloc, RegisterState, String?>(
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
                ),
                const SizedBox(height: 30),
                BlocSelector<RegisterBloc, RegisterState, FormStatus>(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
