import 'package:bloc/bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/login_exception.dart';
import 'package:marketplace_musical_instruments_app/core/validator/user_validator.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authRepository = AuthRepository();
  String _emailText = '';
  String _passwordText = '';

  LoginBloc() : super(LoginState.initial()) {
    on<LoginEmailChangeEvent>(_setLoginEmail);
    on<LoginPasswordChangeEvent>(_setLoginPassword);
    on<LoginSubmitEvent>(_signInUser);
  }

  void _setLoginEmail(
    LoginEmailChangeEvent event,
    Emitter<LoginState> emit,
  ) {
    final emailError = UserValidator.validateEmail(event.email);
    _emailText = event.email;
    emit(
      state.copyWith(
        emailError: emailError,
        clearEmailError: emailError == null,
      ),
    );
  }

  void _setLoginPassword(
    LoginPasswordChangeEvent event,
    Emitter<LoginState> emit,
  ) {
    final passwordError = UserValidator.validatePassword(
      event.password,
    );
    _passwordText = event.password;
    emit(
      state.copyWith(
        passwordError: passwordError,
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
      await _authRepository.signInUser(_emailText, _passwordText);
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
