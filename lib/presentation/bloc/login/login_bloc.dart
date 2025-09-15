import 'package:bloc/bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/login_exception.dart';
import 'package:marketplace_musical_instruments_app/core/util/user_validator_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authRepository = AuthRepository();

  LoginBloc() : super(LoginState.initial()) {
    on<LoginEmailChangeEvent>(_setLoginEmail);
    on<LoginPasswordChangeEvent>(_setLoginPassword);
    on<LoginSubmitEvent>(_signInUser);
  }

  void _setLoginEmail(
    LoginEmailChangeEvent event,
    Emitter<LoginState> emit,
  ) {
    final emailError = UserValidatorUtil.validateEmail(event.email);
    emit(
      state.copyWith(
        emailError: emailError,
        emailText: event.email,
        clearEmailError: emailError == null,
      ),
    );
  }

  void _setLoginPassword(
    LoginPasswordChangeEvent event,
    Emitter<LoginState> emit,
  ) {
    final passwordError = UserValidatorUtil.validatePassword(
      event.password,
    );
    emit(
      state.copyWith(
        passwordError: passwordError,
        passwordText: event.password,
        clearPasswordError: passwordError == null,
      ),
    );
  }

  Future<void> _signInUser(
    LoginSubmitEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (state.emailError != null || state.passwordError != null) return;
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await _authRepository.signInUser(state.emailText, state.passwordText);
      emit(state.copyWith(formStatus: FormStatus.success));
    } on LoginException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.message,
          formStatus: FormStatus.failure,
        ),
      );
    } finally {
      emit(state.copyWith(formStatus: FormStatus.initial));
    }
  }
}
