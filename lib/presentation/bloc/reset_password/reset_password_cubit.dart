import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/reset_password_exception.dart';
import 'package:marketplace_musical_instruments_app/core/state/form_status.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;

  ResetPasswordCubit(this.authRepository) : super(ResetPasswordState.initial());

  void changeUserEmail(String email) {
    emit(state.copyWith(email: email));
  }

  Future<void> sendEmailLetter() async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await authRepository.resetPassword(state.email);
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
