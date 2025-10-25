import 'package:marketplace_musical_instruments_app/core/util/user_validator_util.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class EditProfileState {
  final String avatarUrl;
  final String about;
  final String fullName;
  final String phoneNumber;
  final String errorMessage;
  final FormStatus formStatus;

  EditProfileState({
    required this.avatarUrl,
    required this.about,
    required this.fullName,
    required this.phoneNumber,
    required this.errorMessage,
    required this.formStatus,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      avatarUrl: '',
      about: '',
      fullName: '',
      phoneNumber: '',
      errorMessage: '',
      formStatus: FormStatus.initial,
    );
  }

  EditProfileState copyWith({
    String? avatarUrl,
    String? about,
    String? fullName,
    String? phoneNumber,
    String? errorMessage,
    FormStatus? formStatus,
  }) {
    return EditProfileState(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      about: about ?? this.about,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  String get counterAbout => '${about.length}/115';

  String? get fullNameError => UserValidatorUtil.validateFullName(fullName);

  String? get phoneNumberError =>
      UserValidatorUtil.validatePhoneNumber(phoneNumber);

  String? get aboutError => UserValidatorUtil.validateAboutYourself(about);
}
