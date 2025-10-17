import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

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

final class UserProfileFetchEvent extends EditProfileEvent {
  final UserModel user;

  UserProfileFetchEvent(this.user);
}
