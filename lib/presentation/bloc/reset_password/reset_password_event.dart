sealed class ResetPasswordEvent {}

final class UserEmailChangeEvent extends ResetPasswordEvent {
  final String email;

  UserEmailChangeEvent(this.email);
}
