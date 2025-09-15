sealed class LoginEvent {}

final class LoginEmailChangeEvent extends LoginEvent {
  final String email;

  LoginEmailChangeEvent(this.email);
}

final class LoginPasswordChangeEvent extends LoginEvent {
  final String password;

  LoginPasswordChangeEvent(this.password);
}

final class LoginSubmitEvent extends LoginEvent {}
