import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/register_exception.dart';
import 'package:marketplace_musical_instruments_app/core/util/user_validator_util.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _userRepository = UserRepository();
  final _authRepository = AuthRepository();
  String _fullNameText = '';
  String _emailText = '';
  String _passwordText = '';
  String _phoneNumberText = '';

  RegisterBloc() : super(RegisterState.initial()) {
    on<RegisterFullNameChangeEvent>(_setRegisterFullName);
    on<RegisterEmailChangeEvent>(_setRegisterEmail);
    on<RegisterPasswordChangeEvent>(_setRegisterPassword);
    on<RegisterPhoneNumberChangeEvent>(_setRegisterPhoneNumber);
    on<RegisterSubmitEvent>(_signUpUser);
  }

  void _setRegisterFullName(
    RegisterFullNameChangeEvent event,
    Emitter<RegisterState> emit,
  ) {
    final fullNameError = UserValidatorUtil.validateFullName(
      event.fullName,
    );
    _fullNameText = event.fullName;
    emit(
      state.copyWith(
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
    _emailText = event.email;
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
    _passwordText = event.password;
    emit(
      state.copyWith(
        passwordError: passwordError,
        clearPasswordError: passwordError == null,
      ),
    );
  }

  void _setRegisterPhoneNumber(
    RegisterPhoneNumberChangeEvent event,
    Emitter<RegisterState> emit,
  ) {
    final phoneNumberError = UserValidatorUtil.validatePhoneNumber(
      event.phoneNumber,
    );
    _phoneNumberText = event.phoneNumber;
    emit(
      state.copyWith(
        phoneNumberError: phoneNumberError,
        clearPhoneNumberError: phoneNumberError == null,
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
    try {
      await _authRepository.signUpUser(
        _emailText,
        _passwordText,
        _fullNameText,
        _phoneNumberText,
      );
      emit(state.copyWith(formStatus: FormStatus.success));
    } on RegisterException catch (exception) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
          errorMessage: exception.message,
        ),
      );
    } finally {
      emit(state.copyWith(formStatus: FormStatus.initial));
    }
  }
}
