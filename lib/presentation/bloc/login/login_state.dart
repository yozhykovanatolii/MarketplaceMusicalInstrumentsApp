enum FormStatus { initial, loading, success, failure }

class LoginState {
  final String emailText;
  final String passwordText;
  final String? emailError;
  final String? passwordError;
  final FormStatus formStatus;
  final String errorMessage;

  LoginState({
    required this.emailText,
    required this.passwordText,
    this.emailError,
    this.passwordError,
    required this.formStatus,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return LoginState(
      emailText: '',
      passwordText: '',
      formStatus: FormStatus.initial,
      errorMessage: '',
    );
  }

  LoginState copyWith({
    String? emailText,
    String? passwordText,
    String? emailError,
    String? passwordError,
    FormStatus? formStatus,
    String? errorMessage,
    bool clearEmailError = false,
    bool clearPasswordError = false,
  }) {
    return LoginState(
      emailText: emailText ?? this.emailText,
      passwordText: passwordText ?? this.passwordText,
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError: clearPasswordError
          ? null
          : (passwordError ?? this.passwordError),
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
