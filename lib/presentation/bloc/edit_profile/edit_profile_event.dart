sealed class EditProfileEvent {}

final class ProfileAvatarChangeEvent extends EditProfileEvent {}

final class ProfileFullNameChangeEvent extends EditProfileEvent {
  final String fullName;

  ProfileFullNameChangeEvent(this.fullName);
}

final class ProfilePhoneNumberChangeEvent extends EditProfileEvent {
  final String phoneNumber;

  ProfilePhoneNumberChangeEvent(this.phoneNumber);
}

final class ProfileAboutChangeEvent extends EditProfileEvent {
  final String about;

  ProfileAboutChangeEvent(this.about);
}
