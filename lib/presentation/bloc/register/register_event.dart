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

class RegisterPhoneNumberChangeEvent extends RegisterEvent {
  final String phoneNumber;

  RegisterPhoneNumberChangeEvent(this.phoneNumber);
}

class RegisterSubmitEvent extends RegisterEvent {}
