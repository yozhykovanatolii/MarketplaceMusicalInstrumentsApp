import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/core/util/ui_helper.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/widget/forgot_password_text_button.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/widget/login_email_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/widget/login_password_text_field.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/widget/not_have_account_section.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/widget/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.formStatus == FormStatus.failure) {
            UiHelper.showSnackBar(
              context: context,
              message: state.errorMessage,
              isErrorSnackBar: true,
            );
          }
          if (state.formStatus == FormStatus.success) {
            UiHelper.showSnackBar(
              context: context,
              message: S.of(context).successAuthorization,
            );
            context.go(AppRoutes.mainPage);
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).signIn,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    S.of(context).welcomeBack,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 50),
                  const LoginEmailTextField(),
                  const SizedBox(height: 15),
                  const LoginPasswordTextField(),
                  const SizedBox(height: 15),
                  const ForgotPasswordTextButton(),
                  const SizedBox(height: 30),
                  const SignInButton(),
                  const SizedBox(height: 20),
                  const NotHaveAccountSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
