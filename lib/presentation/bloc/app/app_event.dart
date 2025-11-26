import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';

sealed class AppEvent {}

class AppUserSubscriptionRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  final UserEntity user;

  AppUserChanged(this.user);
}

class AppUserUnauthenticated extends AppEvent {
  final String errorMessage;

  AppUserUnauthenticated(this.errorMessage);
}
