import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordState.initial()) {
    on<UserEmailChangeEvent>(_changeUserEmail);
  }

  void _changeUserEmail(
    UserEmailChangeEvent event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }
}
