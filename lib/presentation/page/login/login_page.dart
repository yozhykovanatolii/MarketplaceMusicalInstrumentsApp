import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/snack_bar_util.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_button.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_progress_indicator.dart';
import 'package:marketplace_musical_instruments_app/core/widget/common_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
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
              'Success authorization',
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
                  'Sign In',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Hi! Welcome back, you\'ve been missed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 50),
                BlocSelector<LoginBloc, LoginState, String?>(
                  selector: (state) => state.emailError,
                  builder: (context, emailError) {
                    return CommonTextField(
                      onChanged: (email) => context.read<LoginBloc>().add(
                        LoginEmailChangeEvent(email),
                      ),
                      prefixIcon: Icons.email,
                      hintText: 'Enter your email',
                      errorText: emailError,
                    );
                  },
                ),
                const SizedBox(height: 15),
                BlocSelector<LoginBloc, LoginState, String?>(
                  selector: (state) => state.passwordError,
                  builder: (context, passwordError) {
                    return CommonTextField(
                      onChanged: (password) => context.read<LoginBloc>().add(
                        LoginPasswordChangeEvent(password),
                      ),
                      prefixIcon: Icons.lock,
                      hintText: 'Enter your password',
                      errorText: passwordError,
                      obscureText: true,
                    );
                  },
                ),
                const SizedBox(height: 30),
                BlocSelector<LoginBloc, LoginState, FormStatus>(
                  selector: (state) => state.formStatus,
                  builder: (context, registerStatus) {
                    final child = registerStatus == FormStatus.loading
                        ? const CommonProgressIndicator(scale: 0.8)
                        : const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          );
                    return CommonButton(
                      onPressed: () => context.read<LoginBloc>().add(
                        LoginSubmitEvent(),
                      ),
                      child: child,
                    );
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  'Or sign in with',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 15),
                CommonButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: const Text(
                    'Sign In with Google',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                    children: [
                      const WidgetSpan(
                        child: SizedBox(width: 5),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Hello, world');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
