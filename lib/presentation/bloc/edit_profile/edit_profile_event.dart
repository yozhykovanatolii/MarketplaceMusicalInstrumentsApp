import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';

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
  final UserEntity user;

  UserProfileFetchEvent(this.user);
}

final class ProfileUpdateEvent extends EditProfileEvent {}

final class ProfileLogoutEvent extends EditProfileEvent {}
