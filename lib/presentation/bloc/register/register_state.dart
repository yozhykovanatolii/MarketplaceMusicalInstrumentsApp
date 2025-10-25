import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class RegisterState {
  final String? fullNameError;
  final String? emailError;
  final String? passwordError;
  final String? phoneNumberError;
  final String errorMessage;
  final FormStatus formStatus;

  RegisterState({
    this.fullNameError,
    this.emailError,
    this.passwordError,
    this.phoneNumberError,
    required this.errorMessage,
    required this.formStatus,
  });

  factory RegisterState.initial() {
    return RegisterState(
      errorMessage: '',
      formStatus: FormStatus.initial,
    );
  }

  RegisterState copyWith({
    String? fullNameError,
    String? emailError,
    String? passwordError,
    String? phoneNumberError,
    String? errorMessage,
    FormStatus? formStatus,
    bool clearFullNameError = false,
    bool clearEmailError = false,
    bool clearPasswordError = false,
    bool clearPhoneNumberError = false,
  }) {
    return RegisterState(
      fullNameError: clearFullNameError
          ? null
          : (fullNameError ?? this.fullNameError),
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError: clearPasswordError
          ? null
          : (passwordError ?? this.passwordError),
      phoneNumberError: clearPhoneNumberError
          ? null
          : (phoneNumberError ?? this.phoneNumberError),
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
