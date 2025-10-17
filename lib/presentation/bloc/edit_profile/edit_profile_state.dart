import 'package:marketplace_musical_instruments_app/core/util/user_validator_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class EditProfileState {
  final String about;
  final String fullName;
  final String phoneNumber;
  final FormStatus formStatus;

  EditProfileState({
    required this.about,
    required this.fullName,
    required this.phoneNumber,
    required this.formStatus,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      about: '',
      fullName: '',
      phoneNumber: '',
      formStatus: FormStatus.initial,
    );
  }

  EditProfileState copyWith({
    String? about,
    String? fullName,
    String? phoneNumber,
    FormStatus? formStatus,
  }) {
    return EditProfileState(
      about: about ?? this.about,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  String get counterAbout => '${about.length}/115';

  String? get fullNameError => UserValidatorUtil.validateFullName(fullName);

  String? get phoneNumberError =>
      UserValidatorUtil.validatePhoneNumber(phoneNumber);

  String? get aboutError => UserValidatorUtil.validateAboutYourself(about);
}
