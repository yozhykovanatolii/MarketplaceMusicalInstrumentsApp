import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/register_exception.dart';
import 'package:marketplace_musical_instruments_app/core/validator/user_validator.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _userRepository = UserRepository();
  final _authRepository = AuthRepository();
  String _emailText = '';

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
    emit(state.copyWith(fullName: event.fullName));
  }

  Future<void> _setRegisterEmail(
    RegisterEmailChangeEvent event,
    Emitter<RegisterState> emit,
  ) async {
    String? emailError = UserValidator.validateEmail(
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
    emit(state.copyWith(email: event.email));
  }

  void _setRegisterPassword(
    RegisterPasswordChangeEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _setRegisterPhoneNumber(
    RegisterPhoneNumberChangeEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  Future<void> _signUpUser(
    RegisterSubmitEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.emailError != null ||
        state.fullNameError != null ||
        state.passwordError != null ||
        state.phoneNumberError != null) {
      return;
    }
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await _authRepository.signUpUser(
        _emailText,
        state.password,
        state.fullName,
        state.phoneNumber,
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
