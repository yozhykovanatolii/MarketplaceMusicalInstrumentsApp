enum FormStatus { initial, loading, success, failure }

class LoginState {
  final String? emailError;
  final String? passwordError;
  final FormStatus formStatus;
  final String errorMessage;

  LoginState({
    this.emailError,
    this.passwordError,
    required this.formStatus,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return LoginState(
      formStatus: FormStatus.initial,
      errorMessage: '',
    );
  }

  LoginState copyWith({
    String? emailError,
    String? passwordError,
    FormStatus? formStatus,
    String? errorMessage,
    bool clearEmailError = false,
    bool clearPasswordError = false,
  }) {
    return LoginState(
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError: clearPasswordError
          ? null
          : (passwordError ?? this.passwordError),
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
