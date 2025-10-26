import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final _userRepository = UserRepository();
  StreamSubscription<UserModel>? _userStreamSubscription;

  AppBloc() : super(AppInitialState()) {
    on<AppUserSubscriptionRequested>(_checkIfUserAuthenticated);
    on<AppUserChanged>(_onUserChanged);
    on<AppUserUnauthenticated>(_onUserUnauthenticated);
  }

  @override
  Future<void> close() {
    _userStreamSubscription?.cancel();
    return super.close();
  }

  void _checkIfUserAuthenticated(
    AppUserSubscriptionRequested event,
    Emitter<AppState> emit,
  ) {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = _userRepository.getUserModelCurrentData().listen(
      (user) => add(
        AppUserChanged(user),
      ),
      onError: (error) {
        final exception = error as UserNotFoundException;
        add(AppUserUnauthenticated(exception.errorMessage));
      },
    );
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {
    emit(UserAuthenticatedState(event.userModel));
  }

  void _onUserUnauthenticated(
    AppUserUnauthenticated event,
    Emitter<AppState> emit,
  ) {
    emit(UserUnauthenticatedState(event.errorMessage));
  }
}
