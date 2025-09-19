import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

sealed class AppEvent {}

class AppUserSubscriptionRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  final UserModel userModel;

  AppUserChanged(this.userModel);
}

class AppUserUnauthenticated extends AppEvent {
  final String errorMessage;

  AppUserUnauthenticated(this.errorMessage);
}
