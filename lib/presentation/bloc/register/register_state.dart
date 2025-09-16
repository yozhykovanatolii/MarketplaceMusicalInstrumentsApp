import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class RegisterState {
  final String fullNameText;
  final String emailText;
  final String passwordText;

  final String? fullNameError;
  final String? emailError;
  final String? passwordError;

  final String errorMessage;
  final FormStatus formStatus;

  RegisterState({
    required this.fullNameText,
    required this.emailText,
    required this.passwordText,
    this.fullNameError,
    this.emailError,
    this.passwordError,
    required this.errorMessage,
    required this.formStatus,
  });

  factory RegisterState.initial() {
    return RegisterState(
      fullNameText: '',
      emailText: '',
      passwordText: '',
      errorMessage: '',
      formStatus: FormStatus.initial,
    );
  }

  RegisterState copyWith({
    String? fullNameText,
    String? emailText,
    String? passwordText,
    String? fullNameError,
    String? emailError,
    String? passwordError,
    String? errorMessage,
    FormStatus? formStatus,
    bool clearFullNameError = false,
    bool clearEmailError = false,
    bool clearPasswordError = false,
  }) {
    return RegisterState(
      fullNameText: fullNameText ?? this.fullNameText,
      emailText: emailText ?? this.emailText,
      passwordText: passwordText ?? this.passwordText,
      fullNameError: clearFullNameError
          ? null
          : (fullNameError ?? this.fullNameError),
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError: clearPasswordError
          ? null
          : (passwordError ?? this.passwordError),
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
