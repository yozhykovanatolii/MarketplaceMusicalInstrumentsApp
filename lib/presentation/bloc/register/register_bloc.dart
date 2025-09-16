import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/util/user_validator_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _userRepository = UserRepository();

  RegisterBloc() : super(RegisterState.initial()) {
    on<RegisterFullNameChangeEvent>(_setRegisterFullName);
    on<RegisterEmailChangeEvent>(_setRegisterEmail);
    on<RegisterPasswordChangeEvent>(_setRegisterPassword);
    on<RegisterSubmitEvent>(_signUpUser);
  }

  void _setRegisterFullName(
    RegisterFullNameChangeEvent event,
    Emitter<RegisterState> emit,
  ) {
    final fullNameError = UserValidatorUtil.validateFullName(
      event.fullName,
    );
    emit(
      state.copyWith(
        fullNameText: event.fullName,
        fullNameError: fullNameError,
        clearFullNameError: fullNameError == null,
      ),
    );
  }

  Future<void> _setRegisterEmail(
    RegisterEmailChangeEvent event,
    Emitter<RegisterState> emit,
  ) async {
    String? emailError = UserValidatorUtil.validateEmail(
      event.email,
    );
    if (emailError == null) {
      final isUserExist = await _userRepository.checkIfUserExistByEmail(
        event.email,
      );
      emailError = isUserExist
          ? 'This email is busy, please choose another one.'
          : null;
    }
    emit(
      state.copyWith(
        emailText: event.email,
        emailError: emailError,
        clearEmailError: emailError == null,
      ),
    );
  }

  void _setRegisterPassword(
    RegisterPasswordChangeEvent event,
    Emitter<RegisterState> emit,
  ) {
    final passwordError = UserValidatorUtil.validatePassword(
      event.password,
    );
    emit(
      state.copyWith(
        passwordText: event.password,
        passwordError: passwordError,
        clearPasswordError: passwordError == null,
      ),
    );
  }

  Future<void> _signUpUser(
    RegisterSubmitEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.emailError != null ||
        state.fullNameError != null ||
        state.passwordError != null) {
      return;
    }
    emit(state.copyWith(formStatus: FormStatus.loading));
  }
}
