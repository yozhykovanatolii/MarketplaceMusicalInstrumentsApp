sealed class RegisterEvent {}

class RegisterFullNameChangeEvent extends RegisterEvent {
  final String fullName;

  RegisterFullNameChangeEvent(this.fullName);
}

class RegisterEmailChangeEvent extends RegisterEvent {
  final String email;

  RegisterEmailChangeEvent(this.email);
}

class RegisterPasswordChangeEvent extends RegisterEvent {
  final String password;

  RegisterPasswordChangeEvent(this.password);
}

class RegisterSubmitEvent extends RegisterEvent {}
