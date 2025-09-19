import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

sealed class AppState {}

final class AppInitialState extends AppState {}

final class UserAuthenticatedState extends AppState {
  final UserModel userModel;

  UserAuthenticatedState(this.userModel);
}

final class UserUnauthenticatedState extends AppState {
  final String errorMessage;

  UserUnauthenticatedState(this.errorMessage);
}
