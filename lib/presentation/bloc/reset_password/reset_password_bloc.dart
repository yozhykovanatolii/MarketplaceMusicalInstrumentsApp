import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/reset_password_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final _authRepository = AuthRepository();

  ResetPasswordBloc() : super(ResetPasswordState.initial()) {
    on<UserEmailChangeEvent>(_changeUserEmail);
    on<EmailLetterSendEvent>(_sendEmailLetter);
  }

  void _changeUserEmail(
    UserEmailChangeEvent event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _sendEmailLetter(
    EmailLetterSendEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await _authRepository.resetPassword(state.email);
      emit(state.copyWith(formStatus: FormStatus.success));
    } on ResetPasswordException catch (exception) {
      emit(
        state.copyWith(
          formStatus: FormStatus.failure,
          errorMessage: exception.errorMessage,
        ),
      );
    } finally {
      emit(state.copyWith(formStatus: FormStatus.initial));
    }
  }
}
