import 'package:marketplace_musical_instruments_app/core/util/user_validator_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class ResetPasswordState {
  final String email;
  final FormStatus formStatus;

  ResetPasswordState({
    required this.email,
    required this.formStatus,
  });

  factory ResetPasswordState.initial() {
    return ResetPasswordState(
      email: '',
      formStatus: FormStatus.initial,
    );
  }

  ResetPasswordState copyWith({
    String? email,
    FormStatus? formStatus,
  }) {
    return ResetPasswordState(
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  String? get emailErrorMessage => UserValidatorUtil.validateEmail(email);
}
